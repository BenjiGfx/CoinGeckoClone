//
//  Repository.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 29.02.24.
//

import Foundation

class Repository {
    
    // Crypto Coins
    
    //MARK: Functions
    
    static func fetchCoins() async throws -> [CryptoCoinModel] {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en") else {
            throw HTTPError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode([CryptoCoinModel].self, from: data)
        return result
    }
    
    // Crypto Exchanges
    
    //MARK: Functions
    
    static func fetchExchanges() async throws -> [Exchanges] {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/exchanges?per_page=100&page=1") else {
            throw HTTPError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode([Exchanges].self, from: data)
        return result
    }
    
    // Crypto News
    
    //MARK: Functions
    
    static func fetchNews() async throws -> [NewsData] {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/news") else {
            throw HTTPError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(NewsModel.self, from: data)
        return response.data
    }
    
    // Crypto Daily Chart Prices
    
    
    //MARK: Functions
    
    static func fetchDailyTF(id: String) async throws -> DailyTFModel {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(id)/market_chart?vs_currency=usd&days=max&interval=daily") else {
            throw HTTPError.invalidURL
        }
        let (data, a) = try await URLSession.shared.data(from: url)
        print(a.description)
        print(String(data: data, encoding: .utf8))
        let response = try JSONDecoder().decode(DailyTFModelResponse.self, from: data)
        return DailyTFModel.fromDailyTFModelResponse(response: response)
    }
}
