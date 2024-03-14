//
//  CoinGeckoCloneApp.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 05.02.24.
//

import SwiftUI
import Firebase

@main
struct CoinGeckoCloneApp: App {
    
    init() {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(CryptoCoinViewModel())
                .environmentObject(ExchangesViewModel())
                .environmentObject(CryptoNewsViewModel())
        }
    }
}
