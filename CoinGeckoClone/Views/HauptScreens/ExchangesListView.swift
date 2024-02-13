//
//  Screen2.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 06.02.24.
//

import SwiftUI

struct ExchangesListView: View {
    
    @StateObject var exchangesViewModel = ExchangesViewModel()
    
    var body: some View {
        VStack {
            Text("Exchanges")
                .bold()
            Spacer()
            HStack {
                Text("Rank")
                    .bold()
                    .frame(maxWidth: 40)
                    .foregroundColor(.gray)
                    .font(.footnote)
                Text("Name")
                    .bold()
                    .frame(maxWidth: 90)
                    .foregroundColor(.gray)
                    .font(.footnote)
                Spacer()
                Text("Exchange Volume")
                    .bold()
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
    }
}
