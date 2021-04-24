//
//  Better.swift
//  Networking
//
//  Created by luis.gustavo.jacinto on 21/04/21.
//

import Foundation

public struct Better: Decodable {
    public let username: String
    public let image: URL
    public let wins: Int
    public let losses: Int
    
    enum CodingKeys: String, CodingKey {
        case username = "username"
        case image = "image"
        case wins = "total_win"
        case losses = "total_lose"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.username = try container.decode(String.self, forKey: .username)
        self.image = try container.decode(URL.self, forKey: .image)
        self.wins = try container.decode(Int.self, forKey: .wins)
        self.losses = try container.decode(Int.self, forKey: .losses)
    }
}
