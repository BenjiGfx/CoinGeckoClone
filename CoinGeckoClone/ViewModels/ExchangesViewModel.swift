//
//  ExchangesViewModel.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 07.02.24.
//

import Foundation

@MainActor
class ExchangesViewModel: ObservableObject {
    
    init() {
        fetchData()
    }
    
    // MARK: Variables
    
    @Published var exchanges = [Exchanges]()
    @Published var exchangesHistory = [initialExchanges]
    private static let initialExchanges = [
        Exchanges(id: "binance", name: "Binance", yearEstablished: 2017, country: "Islands", description: "", url: "https://www.binance.com/", image: "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1706864274", hasTradingIncentive: false, trustScore: 10, trustScoreRank: 1, tradeVolume24HBtc: 243053.96170208574, tradeVolume24HBtcNormalized: 148987.6582736287)
    ]
    
    // MARK: Functions
    
    func fetchData() {
        Task {
            do {
                self.exchanges = try await fetchExchanges()
                print(self.exchanges)
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
    
    private func fetchExchanges() async throws -> [Exchanges] {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/exchanges?per_page=100&page=1") else {
            throw HTTPError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode([Exchanges].self, from: data)
        exchangesHistory.append(result)
        return result
    }
}

