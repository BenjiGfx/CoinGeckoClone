//
//  ContentView.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 05.02.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            CryptoCoinListView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
                .tag(0)
            ExchangesListView()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                }
                .tag(1)
            CoinsDetailView()
                .tabItem {
                    Image(systemName: "list.dash")
                }
                .tag(2)
            NFTs()
                .tabItem {
                    Image(systemName: "star.fill")
                }
                .tag(3)
            News()
                .tabItem {
                    Image(systemName: "person.fill")
                }
                .tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
