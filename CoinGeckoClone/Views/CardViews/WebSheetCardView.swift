//
//  WebSheetCardView.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 20.03.24.
//

import SwiftUI

struct WebSheetCardView: View {
    
    let exchanges: Exchanges
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: exchanges.image)!) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(systemName: "bitcoinsign.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .padding()
            }
            .frame(width: 30, height: 30)
            VStack(alignment: .leading) {
                HStack {
                    Text(exchanges.name)
                        .bold()
                    Spacer()
                }
                Text(exchanges.url)
                    .font(.footnote)
                    .foregroundColor(.accentColor)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
        }
        .padding(8)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 1)
        )
        .padding(8)
    }
}

struct WebSheetCardView_Previews: PreviewProvider {
    static var previews: some View {
        WebSheetCardView(exchanges: Exchanges(id: "binance", name: "Binance", yearEstablished: 2017, country: "Islands", description: "", url: "https://www.binance.com/", image: "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1706864274", hasTradingIncentive: false, trustScore: 10, trustScoreRank: 1, tradeVolume24HBtc: 243053.96170208574, tradeVolume24HBtcNormalized: 148987.6582736287))
    }
}
