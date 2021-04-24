//
//  LocalJSONBetService.swift
//  Networking
//
//  Created by luis.gustavo.jacinto on 21/04/21.
//

import Foundation

public final class LocalJSONBetService: BetServiceProtocol {
    
    private let fileName: String
    private let fileExtension = "json"
    private let bundle: Bundle
    
    private var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }
    private var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)
        return decoder
    }
    
    public init(fileName: String, bundle: Bundle = .init(for: LocalJSONBetService.self)) {
        self.fileName = fileName
        self.bundle = bundle
    }
    
    public func retrieveAllBets(_ completion: @escaping (Result<[Bet], Error>) -> Void) {
        guard let url = bundle.url(forResource: fileName, withExtension: fileExtension) else { preconditionFailure("URL from bundle must exist") }
        do {
            let data = try Data(contentsOf: url, options: .dataReadingMapped)
            let bet = try decoder.decode(Bet.Data.self, from: data)
            completion(.success(bet.data))
        } catch let error {
            completion(.failure(error))
        }
    }
}
