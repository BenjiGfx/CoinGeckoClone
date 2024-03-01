//
//  Screen2.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 06.02.24.
//

import SwiftUI

struct ExchangesListView: View {
    
    @EnvironmentObject var exchangesViewModel: ExchangesViewModel
    @EnvironmentObject var cryptoCoinViewModel: CryptoCoinViewModel
    
    var body: some View {
        VStack {
            Text("Exchanges")
                .bold()
            Spacer()
            HStack {
                Text("#")
                    .frame(maxWidth: 25)
                    .foregroundColor(.gray)
                    .font(.footnote)
                Text("Exchange")
                    .bold()
                    .frame(maxWidth: 90)
                    .foregroundColor(.gray)
                    .font(.footnote)
                Spacer()
                Text("Trustscore")
                    .bold()
                    .frame(maxWidth: 76)
                    .foregroundColor(.gray)
                    .font(.footnote)
                Text("Exchange Volume")
                    .bold()
                    .frame(maxWidth: 125)
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
            .padding(8)
            Divider()
            ScrollView {
                VStack {
                    ForEach(exchangesViewModel.exchanges) { exchange in
                        ExchangesCardView(exchanges: exchange)
                    }
                }
                .onAppear {
                    exchangesViewModel.fetchData()
                }
            }
        }
    }
}

struct ExchangesListView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangesListView()
            .environmentObject(ExchangesViewModel())
            .environmentObject(CryptoCoinViewModel())
    }
}
