//
//  BetServiceProtocol.swift
//  Networking
//
//  Created by luis.gustavo.jacinto on 21/04/21.
//

import Foundation

public protocol BetServiceProtocol {
    func retrieveAllBets(_ completion: @escaping (Swift.Result<[Bet], Error>) -> Void)
}
