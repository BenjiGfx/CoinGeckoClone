//
//  CryptoCoinViewModel.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 05.02.24.
//

import Foundation
import CoreData

@MainActor
class CryptoCoinViewModel: ObservableObject {
    init() {
        fetchData()
    }
    //MARK: Variables
    
    @Published var coinData = initialCoinData
    @Published var coinDataHistory = [initialCoinData]
    private static let initialCoinData = [
        CryptoCoinModel(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400", currentPrice: 42673, marketCap: 837027936813, marketCapRank: 1, fullyDilutedValuation: 895937719042, totalVolume: 18752798176, high24H: 43520, low24H: 42284, priceChange24H: -201.97362076784339, priceChangePercentage24H: -0.47108, marketCapChange24H: -3940893373.8477783, marketCapChangePercentage24H: -0.46861, circulatingSupply: 19619206, totalSupply: 21000000, maxSupply: 21000000, ath: 69045, athChangePercentage: -38.21023, athDate: "2021-11-10T14:24:11.849Z", atl: 67.81, atlChangePercentage: 62815.84738, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2024-02-05T18:04:29.141Z", sparklineIn7D: SparklineIn7D(price: [43014.86733307615, 42971.904926316914]), priceChangePercentage24HInCurrency: -0.47107884992198734)
    ]
    
    //MARK: Functions
    
    func fetchData() {
        Task {
            do {
                self.coinData = try await Repository.fetchCoins()
            } catch {
                print("Request failed with error: \(error)")
            }
            print("writing coins to firestore")
            writeCoinsToFirestore()
        }
    }
    
    func writeCoinsToFirestore() {
        for coin in self.coinData {
            FirebaseManager.writeCoin(coin: coin)
        }
    }
    
    func fetchCoinsFromFirestore() {
        coinData = FirebaseManager.fetchAllCoins()
        if coinData.isEmpty {
            print("Leere Liste an Coins aus Firestore erhalten.")
            coinData = Self.initialCoinData
        }
    }
}
