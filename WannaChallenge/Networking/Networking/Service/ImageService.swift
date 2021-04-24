//
//  ImageService.swift
//  Networking
//
//  Created by luis.gustavo.jacinto on 21/04/21.
//

import UIKit

public final class ImageService: ImageServiceProtocol {
    
    // MARK: - Properties
    private let cache = ImageCache()
    
    // MARK: - Init
    public init() { }
    
    public func retrieveImage(from url: URL, returnOnQueue queue: DispatchQueue, _ completion: @escaping (Result<UIImage, Error>) -> Void) {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            if let image = self.cache[url] {
                queue.async {
                    completion(.success(image))
                    return
                }
            }
            
            do {
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data) else { preconditionFailure("Image from data must exist") }
                queue.async {
                    completion(.success(image))
                }
            } catch let error {
                queue.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
