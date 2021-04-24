//
//  BetProvider.swift
//  Networking
//
//  Created by luis.gustavo.jacinto on 21/04/21.
//

import Foundation

public final class BetProvider: BetProviderProtocol {
    
    // MARK: - Properties
    private let service: BetServiceProtocol
    
    // MARK: - Init
    public init(service: BetServiceProtocol) {
        self.service = service
    }
    
    public func retrieveAllBets(_ completion: @escaping (Result<[Bet], Error>) -> Void) {
        service.retrieveAllBets(completion)
    }
}
