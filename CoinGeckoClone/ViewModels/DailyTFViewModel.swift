//
//  DailyTFViewModel.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 20.02.24.
//

import Foundation


@MainActor
class DailyTFViewModel: ObservableObject {
    
    @Published var preise = [Double]()
    
    
    // MARK: Variables
    
    @Published var dailyTFs: DailyTFModel = initialDailyTF
    @Published var DailyTFHistory = initialDailyTF
    private static let initialDailyTF = DailyTFModel(prices: [[123, 1000]])
    
    // MARK: Functions
    
    func getPrices(id: String) -> [Double] {
        fetchData(id: id)
        return self.preise
    }
    
    func fetchData(id: String) {
        Task {
            do {
                self.dailyTFs = try await fetchDailyTF(id: id)
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
    
    private func fetchDailyTF(id: String) async throws -> DailyTFModel {
        preise = []
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(id)/market_chart?vs_currency=usd&days=max&interval=daily") else {
            throw HTTPError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(DailyTFModel.self, from: data)
        for price in result.prices{
            preise.append(price[1])
        }
        return result
    }
}
