//
//  DailyTFViewModel.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 20.02.24.
//

import Foundation


@MainActor
class DailyTFViewModel: ObservableObject {

    
    
     var preise = [Double]()
    
    
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
                self.dailyTFs = try await Repository.fetchDailyTF(id: id)
                preise = []
                for price in dailyTFs.prices{
                    preise.append(price[1])
                }
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
}
