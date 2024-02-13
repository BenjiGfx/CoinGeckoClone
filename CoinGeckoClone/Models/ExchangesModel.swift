//
//  ExchangesModel.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 07.02.24.
//

import Foundation

// Model:
struct Exchanges: Identifiable, Codable {
    let id, name: String
    let yearEstablished: Int?
    let country, description: String?
    let url: String
    let image: String
    let hasTradingIncentive: Bool?
    let trustScore, trustScoreRank: Int
    let tradeVolume24HBtc, tradeVolume24HBtcNormalized: Double
    
    // CodingKeys:
    enum CodingKeys: String, CodingKey {
        case id, name
        case yearEstablished = "year_established"
        case country, description, url, image
        case hasTradingIncentive = "has_trading_incentive"
        case trustScore = "trust_score"
        case trustScoreRank = "trust_score_rank"
        case tradeVolume24HBtc = "trade_volume_24h_btc"
        case tradeVolume24HBtcNormalized = "trade_volume_24h_btc_normalized"
    }
}
