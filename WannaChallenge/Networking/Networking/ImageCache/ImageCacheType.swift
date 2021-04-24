//
//  ImageCacheType.swift
//  Networking
//
//  Created by luis.gustavo.jacinto on 21/04/21.
//

import Foundation

import UIKit

// Declares in-memory image cache
protocol ImageCacheType: class {
  // Returns the image associated with a given url
  func image(for url: URL) -> UIImage?
  // Inserts the image of the specified url in the cache
  func insertImage(_ image: UIImage?, for url: URL)
  // Removes the image of the specified url in the cache
  func removeImage(for url: URL)
  // Accesses the value associated with the given key for reading and writing
  subscript(_ url: URL) -> UIImage? { get set }
}
