//
//  ImageServiceTests.swift
//  NetworkingTests
//
//  Created by luis.gustavo.jacinto on 24/04/21.
//

import XCTest
@testable import Networking

class ImageServiceTests: XCTestCase {
    
    var sut: ImageService!

    override func setUpWithError() throws {
        self.sut = ImageService()
    }

    override func tearDownWithError() throws {
        self.sut = nil
    }

    func testRetrieveImage() {
        let bundle = Bundle.init(for: ImageServiceTests.self)
        let url = bundle.url(forResource: "baltimore", withExtension: "png")!
        let exp = expectation(description: "success")
        sut.retrieveImage(from: url, returnOnQueue: .main) { result in
            switch result {
            case .success(_):
                exp.fulfill()
            case .failure(_): break
            }
        }
        
        wait(for: [exp], timeout: 1.0)
    }
}
