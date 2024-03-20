//
//  DailyTFViewModel.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 20.02.24.
//

import Foundation


@MainActor
class DailyTFViewModel: ObservableObject {

    init() {

    }
    
    
    
    // MARK: Variables
    
    @Published var dailyTF: DailyTFModel = initialDailyTF
    private static let initialDailyTF = DailyTFModel(id: "bitcoin", prices: [Value(timestamp: "123", price: 1000)])
    
    // MARK: Functions
    
    func getDailyTF(id: String) -> DailyTFModel {
        fetchData(id: id)
        return self.dailyTF
        
    }
    
    func fetchData(id: String) {
        Task {
            do {
                dailyTF = try await Repository.fetchDailyTF(id: id)
            } catch {
                print("Request failed with error: \(error)")
            }
            print("writing dailyTFs to firestore")
            FirebaseManager.writeDailyTF(dailyTF: dailyTF)
        }
    }
}
