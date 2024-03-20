//
//  FirebaseManager.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 13.03.24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift


class FirebaseManager {
    
    static let shared = FirebaseManager()
    
    let auth = Auth.auth()
    let database = Firestore.firestore()
    
    // COINS
    
    // Erstelle ein Coin-Dokument im Firestore
    static func writeCoin(coin: CryptoCoinModel) {
        do {
            try shared.database.collection("Cryptocoins").document(coin.id).setData(from: coin)
        } catch {
            print("Fehler beim Speichern des Coins")
        }
    }
    
    // Ein Coin wird mit der ID geladen
    static func fetchCoin(id: String) -> CryptoCoinModel? {
        var coin: CryptoCoinModel? = nil
        shared.database.collection("Cryptocoins").document(id).getDocument { document, error in
            if let error {
                print("Fetching user failed:", error.localizedDescription)
                return
            }
            
            guard let document else {
                print("Dokument existiert nicht!")
                return
            }
            
            do {
                coin = try document.data(as: CryptoCoinModel.self)
            } catch {
                print("Dokument ist kein Coin", error.localizedDescription)
            }
        }
        return coin
    }
    
    // Alle Coins werden mit der ID geladen
    static func fetchAllCoins() -> [CryptoCoinModel] {
        var coins = [CryptoCoinModel]()
        Task {
            do {
                let snapshot = try await shared.database.collection("Cryptocoins").getDocuments { snapshot, error in
                    if let error {
                        print("Fetching coins failed:", error.localizedDescription)
                        return
                    }
                    
                    guard let snapshot else {
                        print("Dokument existiert nicht!")
                        return
                    }
                    
                    print("\(snapshot.documents.count)")
                    snapshot.documents.forEach{ document in
                        print("begin snapshot.documents.foreach")
                        do {
                            let coin = try document.data(as: CryptoCoinModel.self)
                            print("coin successfully parsed: \(coins.count)")
                            coins.append(coin)
                        } catch {
                            print("Dokument ist kein Coin", error.localizedDescription)
                        }
                        print("finished snapshot.documents.foreach")
                    }
                }
            }
        }
        print("FirebaseManager.fetchCoin: \(coins)")
        return coins
    }
    
    
    // EXCHANGES
    
    // Erstelle ein Exchange-Dokument im Firestore
    static func writeExchange(exchange: Exchanges) {
        do {
            try shared.database.collection("Exchanges").document(exchange.id).setData(from: exchange)
        } catch {
            print("Fehler beim Speichern der Exchange")
        }
    }
    
    // Ein Exchange wird mit der ID geladen
    static func fetchExchange(id: String) -> Exchanges? {
        var exchange: Exchanges? = nil
        shared.database.collection("Exchanges").document(id).getDocument { document, error in
            if let error {
                print("Fetching user failed:", error.localizedDescription)
                return
            }
            
            guard let document else {
                print("Dokument existiert nicht!")
                return
            }
            
            do {
                exchange = try document.data(as: Exchanges.self)
            } catch {
                print("Dokument ist kein Exchange", error.localizedDescription)
            }
        }
        return exchange
    }
    
    // Alle Exchanges werden mit der ID geladen
    static func fetchAllExchanges() -> [Exchanges] {
        var exchanges = [Exchanges]()
        shared.database.collection("Exchanges").getDocuments { snapshot, error in
            if let error {
                print("Fetching exchanges failed:", error.localizedDescription)
                return
            }
            
            guard let snapshot else {
                print("Dokument existiert nicht!")
                return
            }
            snapshot.documents.forEach({ document in
                do {
                    let exchange = try document.data(as: Exchanges.self)
                    exchanges.append(exchange)
                } catch {
                    print("Dokument ist kein Exchange", error.localizedDescription)
                }
            })
        }
        return exchanges
    }
    
    // DAILYTIMEFRAMES
    
    // Erstelle ein DailyTF-Dokument im Firestore
    static func writeDailyTF(dailyTF: DailyTFModel) {
        do {
            try shared.database.collection("DailyTFs").document(dailyTF.id).setData(from: dailyTF)
        } catch {
            print("Fehler beim Speichern der Exchange")
        }
    }
    
    // Ein DailyTF wird mit der ID geladen
    static func fetchDailyTF(id: String) -> DailyTFModel? {
        var dailyTF: DailyTFModel? = nil
        shared.database.collection("DailyTFs").document(id).getDocument { document, error in
            if let error {
                print("Fetching dailyTF failed:", error.localizedDescription)
                return
            }
            
            guard let document else {
                print("Dokument existiert nicht!")
                return
            }
            
            do {
                dailyTF = try document.data(as: DailyTFModel.self)
            } catch {
                print("Dokument ist kein DailyTF", error.localizedDescription)
            }
        }
        return dailyTF
    }
    
    // Alle DailyTFs werden mit der ID geladen
    static func fetchAllDailyTFs() -> [DailyTFModel] {
        var dailyTFs = [DailyTFModel]()
        shared.database.collection("DailyTFs").getDocuments { snapshot, error in
            if let error {
                print("Fetching dailyTFs failed:", error.localizedDescription)
                return
            }
            
            guard let snapshot else {
                print("Dokument existiert nicht!")
                return
            }
            snapshot.documents.forEach({ document in
                do {
                    let dailyTF = try document.data(as: DailyTFModel.self)
                    dailyTFs.append(dailyTF)
                } catch {
                    print("Dokument ist kein DailyTF", error.localizedDescription)
                }
            })
        }
        return dailyTFs
    }
}
