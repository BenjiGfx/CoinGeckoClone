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
    
    
     var preise = [Double]()
    
    
    // MARK: Variables
    
    @Published var dailyTFs: [DailyTFModel] = initialDailyTF
    @Published var DailyTFHistory = initialDailyTF
    private static let initialDailyTF = DailyTFModel(prices: [Value(timestamp: "123", price: 1000)])
    
    // MARK: Functions
    
    func getPrices(id: String) -> [Double] {
        fetchData(id: id)
        return self.preise
        
    }
    
    func fetchData(id: String) {
        Task {
            do {
                dailyTFs = try await Repository.fetchDailyTF(id: id)
                preise = []
                for price in dailyTFs.prices{
                    preise.append(price.price)
                }
            } catch {
                print("Request failed with error: \(error)")
            }
            print("writing dailyTFs to firestore")
            writeDailyTFsToFirestore(id: id)
        }
    }
    
    func writeDailyTFsToFirestore(id: String) {
            FirebaseManager.writeDailyTF(dailyTF: dailyTFs, id: id)
    }
    
    func fetchDailyTFsFromFirestore() {
        dailyTFs = FirebaseManager.fetchAllDailyTFs()
        if dailyTFs.prices.isEmpty {
            print("Leehre Liste an DailyTFs aus Firestore erhalten")
            dailyTFs = Self.initialDailyTF
        }
    }
}
