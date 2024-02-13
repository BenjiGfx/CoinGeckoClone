//
//  ExchangesCardView.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 07.02.24.
//

import SwiftUI

struct ExchangesCardView: View {
    
    let exchanges: Exchanges
    
    var body: some View {
        HStack {
            Text("\(exchanges.trustScoreRank)")
                .frame(minWidth: 25)
            Divider()
            AsyncImage(url: URL(string: exchanges.image)!) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(systemName: "bitcoinsign.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .padding()
            }
            .frame(width: 30, height: 30)
            VStack(alignment: .leading) {
                Text(exchanges.name)
                    .bold()
                HStack {
                    Text(exchanges.country ?? "N/V")
                        .foregroundColor(.gray)
                        .font(.footnote)
                    Text("\((exchanges.yearEstablished ?? 0).description)")
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
            }
            Spacer()
            Text(String(format: "%.2f", exchanges.tradeVolume24HBtc))
        }
        .padding(8)
    }
}

struct ExchangesCardView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangesCardView(exchanges: Exchanges(id: "binance", name: "Binance", yearEstablished: 2017, country: "Islands", description: "", url: "https://www.binance.com/", image: "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1706864274", hasTradingIncentive: false, trustScore: 10, trustScoreRank: 1, tradeVolume24HBtc: 243053.96170208574, tradeVolume24HBtcNormalized: 148987.6582736287))
    }
}
