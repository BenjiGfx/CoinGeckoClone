//
//  DailyTFModel.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 20.02.24.
//

import Foundation

struct DailyTFModel: Codable {
    let id: String
    let prices: [Value]
    
    static func fromDailyTFModelResponse(response: DailyTFModelResponse) -> Self {
        let prices = response.prices.map { e in
            let timestamp = String(e[0])
            let price = e[1]
            return Value(timestamp: timestamp, price: price)
        }
        return Self(prices: prices)
    }
    
}

struct Value: Codable {
    let timestamp: String
    let price: Double
}

struct DailyTFModelResponse: Codable {
    let prices: [[Double]]
}
