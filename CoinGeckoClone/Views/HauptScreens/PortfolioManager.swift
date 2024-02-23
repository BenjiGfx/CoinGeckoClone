//
//  PortfolioManager.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 22.02.24.
//

import SwiftUI

struct PortfolioManager: View {
    
    @State private var searchText = ""
    @State private var isSearching = false
    let coins: [CryptoCoinModel]
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $searchText, isSearching: $isSearching, coins: coins)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .padding(.horizontal)

            }
        }
    }
}

struct PortfolioManager_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioManager(coins: [])
            .previewDisplayName("Portfolio Manager Preview")
    }
}
