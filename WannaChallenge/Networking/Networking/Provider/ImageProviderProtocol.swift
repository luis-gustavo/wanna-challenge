//
//  ImageProviderProtocol.swift
//  Networking
//
//  Created by luis.gustavo.jacinto on 21/04/21.
//

import Foundation
import UIKit

public protocol ImageProviderProtocol {
    func retrieveImage(from url: URL, returnOnQueue queue: DispatchQueue, _ completion: @escaping (Swift.Result<UIImage, Error>) -> Void)
}
