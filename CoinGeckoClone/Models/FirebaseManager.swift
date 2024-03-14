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
    
    // Ein Coin wird mit der ID geladen
    static func fetchAllCoins() -> [CryptoCoinModel] {
        var coins = [CryptoCoinModel]()
        shared.database.collection("Cryptocoins").getDocuments { snapshot, error in
            if let error {
                print("Fetching coins failed:", error.localizedDescription)
                return
            }
            
            guard let snapshot else {
                print("Dokument existiert nicht!")
                return
            }
            snapshot.documents.forEach({ document in
                do {
                    let coin = try document.data(as: CryptoCoinModel.self)
                    coins.append(coin)
                } catch {
                    print("Dokument ist kein Coin", error.localizedDescription)
                }
            })
        }
        return coins
    }
}
