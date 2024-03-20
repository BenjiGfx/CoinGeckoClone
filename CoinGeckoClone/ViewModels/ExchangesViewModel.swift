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
            self.exchanges = []
            do {
                self.exchanges = try await Repository.fetchExchanges()
                writeExchangesToFirestore()
            } catch {
                print("API-Request failed with error: \(error)")
                await fetchExchangesFromFirestore()
                if self.exchanges.isEmpty {
                    self.exchanges = Self.initialExchanges
                }
            }
            exchanges.sort(by: {$0.trustScoreRank < $1.trustScoreRank})
        }
    }
    
    func writeExchangesToFirestore() {
        if exchanges == Self.initialExchanges {
            return
        }
        for exchange in self.exchanges {
            FirebaseManager.writeExchange(exchange: exchange)
        }
    }
    
    func fetchExchangesFromFirestore() async {
        exchanges = []
        do {
            let snapshot = try await FirebaseManager.shared.database.collection("Exchanges").getDocuments()
            snapshot.documents.forEach { document in
                do {
                    let exchange = try document.data(as: Exchanges.self)
                    self.exchanges.append(exchange)
                } catch {
                    print("Dokument ist kein Exchange", error.localizedDescription)
                }
            }
        } catch {
            print("Firestore-Request failed with error: \(error)")
        }
    }
}

