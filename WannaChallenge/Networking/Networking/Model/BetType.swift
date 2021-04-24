//
//  BetType.swift
//  Networking
//
//  Created by luis.gustavo.jacinto on 22/04/21.
//

import Foundation

public enum BetType: String, Decodable {
    case overUnder = "over_under"
    case spread = "spread"
}
