//
//  LocalJSONBetServiceTests.swift
//  NetworkingTests
//
//  Created by luis.gustavo.jacinto on 24/04/21.
//

import XCTest
@testable import Networking

class LocalJSONBetServiceTests: XCTestCase {
    
    var sut: LocalJSONBetService!

    override func setUpWithError() throws {
        self.sut = LocalJSONBetService(fileName: "datamock", bundle: .init(for: LocalJSONBetServiceTests.self))
    }

    override func tearDownWithError() throws {
        self.sut = nil
    }

    func testRetrieveBets() {
        let exp = expectation(description: "success")
        
        sut.retrieveAllBets { result in
            switch result {
            case .success(let bets):
                XCTAssertEqual(bets.count, 1)
                XCTAssertEqual(bets.first!.awayTeam.name, "Baltimore")
                exp.fulfill()
            case .failure(_): break
            }
        }
        
        wait(for: [exp], timeout: 1.0)
    }
}
