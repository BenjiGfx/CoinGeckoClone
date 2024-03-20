//
//  CryptoCoinListView.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 05.02.24.
//

import SwiftUI

struct CryptoCoinListView: View {
    
    @EnvironmentObject var cryptoCoinViewModel: CryptoCoinViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Coins")
                    .bold()
                Spacer()
                HStack {
                    Text("#")
                        .bold()
                        .frame(maxWidth: 25)
                        .foregroundColor(.gray)
                        .font(.footnote)
                    Text("Coin")
                        .bold()
                        .frame(maxWidth: 49)
                        .foregroundColor(.gray)
                        .font(.footnote)
                    Text("Price")
                        .frame(maxWidth: 100)
                        .bold()
                        .foregroundColor(.gray)
                        .font(.footnote)
                    Text("24H")
                        .frame(maxWidth: 45)
                        .bold()
                        .foregroundColor(.gray)
                        .font(.footnote)
                    Spacer()
                    Text("MarketCap")
                        .bold()
                        .frame(maxWidth: 125)
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
                .padding(8)
                Divider()
                ScrollView {
                    VStack {
                        ForEach(cryptoCoinViewModel.coinData) { coin in
                            NavigationLink(destination: CryptoCoinDetailView(coin: coin)) {
                                CryptoCoinCardView(cryptoCoins: coin)
                            }
                            Divider()
                        }
                    }
                }
            }
        }
    }
}

struct CryptoCoinListView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoCoinListView()
            .environmentObject(CryptoCoinViewModel())
    }
}
