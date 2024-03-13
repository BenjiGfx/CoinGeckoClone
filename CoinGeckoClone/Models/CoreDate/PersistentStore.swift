//
//  PersistentStore.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 11.03.24.
//

import Foundation
import CoreData

struct PersistentStore {
    
    static let shared = PersistentStore()
    
    init() {
        container = NSPersistentContainer(name: "CoinGeckoClone")
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Error with Core Data: \(error), \(error.userInfo)")
            }
        }
    }
    
    // MARK: - Variables
    
    private let container: NSPersistentContainer
    var context: NSManagedObjectContext { container.viewContext }
    
    
    // MARK: - Functions
    
    func save() {
        guard context.hasChanges else { return }
        
        do {
            try context.save()
        } catch let error as NSError {
            NSLog("Unresolved error saving context: \(error), \(error.userInfo)")
        }
    }
}
