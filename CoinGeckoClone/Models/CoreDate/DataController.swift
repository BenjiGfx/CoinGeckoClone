//
//  DataController.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 06.02.24.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    private let container = NSPersistentContainer(name: "CryptoCoinModel")
    private let entityName: String = "Coin"
    
    @Published var savedEntities: [Coin] = []
    
    
    init() {
        container.loadPersistentStores { (_, error)in
            if let error = error {
                print("Failed to load the data \(error)")
            }
        }
    }
    
    private func getCoinData() {
        let request = NSFetchRequest<Coin>(entityName: entityName)
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Failed to fetch CoinData. \(error)")
        }
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Failed to save CoinData. \(error)")
        }
    }
}
