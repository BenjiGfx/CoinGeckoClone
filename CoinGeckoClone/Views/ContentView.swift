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
                    Image(systemName: "dollarsign.square")
                }
                .tag(0)
            ExchangesListView()
                .tabItem {
                    Image(systemName: "banknote")
                }
                .tag(1)
//            CoinPicker()
//                .tabItem {
//                    Image(systemName: "list.dash")
//                }
//                .tag(2)
            News()
                .tabItem {
                    Image(systemName: "list.dash")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
