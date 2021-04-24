//
//  ImageProvider.swift
//  Networking
//
//  Created by luis.gustavo.jacinto on 21/04/21.
//

import Foundation
import UIKit

public final class ImageProvider: ImageProviderProtocol {
    
    // MARK: - Properties
    private let service: ImageServiceProtocol
    
    // MARK: - Init
    public init(service: ImageServiceProtocol) {
        self.service = service
    }
    
    public func retrieveImage(from url: URL, returnOnQueue queue: DispatchQueue = .main, _ completion: @escaping (Result<UIImage, Error>) -> Void) {
        service.retrieveImage(from: url, returnOnQueue: queue, completion)
    }
}
