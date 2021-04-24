//
//  Bet.swift
//  Networking
//
//  Created by luis.gustavo.jacinto on 21/04/21.
//

import Foundation

public struct Bet: Decodable {
    public let homeTeam: Team
    public let awayTeam: Team
    public let better: Better
    public let taker: Better
    public let event: BetEvent
    public let betType: BetType
    
    enum CodingKeys: String, CodingKey {
        case homeTeam = "home_team"
        case awayTeam = "away_team"
        case better = "better"
        case taker = "taker"
        case event = "event"
        case betType = "bet_type"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.homeTeam = try container.decode(Team.self, forKey: .homeTeam)
        self.awayTeam = try container.decode(Team.self, forKey: .awayTeam)
        self.better = try container.decode(Better.self, forKey: .better)
        self.taker = try container.decode(Better.self, forKey: .taker)
        self.event = try container.decode(BetEvent.self, forKey: .event)
        self.betType = try container.decode(BetType.self, forKey: .betType)
    }
    
    struct Data: Decodable {
        let data: [Bet]
    }
}
