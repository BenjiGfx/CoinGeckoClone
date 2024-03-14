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
    
    @Published var exchanges = initialExchanges
    @Published var exchangesHistory = [initialExchanges]
    private static let initialExchanges = [
        Exchanges(id: "binance", name: "Binance", yearEstablished: 2017, country: "Islands", description: "", url: "https://www.binance.com/", image: "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1706864274", hasTradingIncentive: false, trustScore: 10, trustScoreRank: 1, tradeVolume24HBtc: 243053.96170208574, tradeVolume24HBtcNormalized: 148987.6582736287)
    ]
    
    // MARK: Functions
    
    func fetchData() {
        Task {
            do {
                self.exchanges = try await Repository.fetchExchanges()
            } catch {
                print("Request failed with error: \(error)")
            }
            print("writing exchanges to firestore")
            writeExchangesToFirestore()
        }
    }
    
    func writeExchangesToFirestore() {
        for exchange in self.exchanges {
            FirebaseManager.writeExchange(exchange: exchange)
        }
    }
    
    func fetchExchangesFromFirestore() {
        exchanges = FirebaseManager.fetchAllExchanges()
        if exchanges.isEmpty {
            print("Leere Liste an Exchanges aus Firestore erhalten")
            exchanges = Self.initialExchanges
        }
    }
}

