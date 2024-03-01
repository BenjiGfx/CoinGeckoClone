//
//  ExchangesCardView.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 07.02.24.
//

import SwiftUI

struct ExchangesCardView: View {
    
    @EnvironmentObject var cryptoCoinViewModel: CryptoCoinViewModel
    
    let exchanges: Exchanges
    
    func getCurrentPrice() -> Double {
        return cryptoCoinViewModel.coinData.first(where: {$0.id == "bitcoin"})!.currentPrice
    }
    
    
    
    func getBackgroundColor(for trustScore: Int) -> Color {
        if trustScore < 6 {
            return Color.red
        } else if trustScore < 8 {
            return Color.yellow
        } else {
            return Color.green
        }
    }
    
    var body: some View {
        HStack {
            Text("\(exchanges.trustScoreRank)")
                .frame(minWidth: 25)
                .font(.footnote)
                .foregroundColor(.gray)
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
                Text(exchanges.name)
                .textCase(.uppercase)
                .foregroundColor(.black).font(.footnote)
                .frame(maxWidth: 90, alignment: .leading)
            Spacer()
            Text("\(exchanges.trustScore) / 10")
                .frame(minWidth: 25)
                .font(.footnote)
                .bold()
                .foregroundColor(.white)
                .padding(5)
                .background(getBackgroundColor(for: exchanges.trustScore))
                .cornerRadius(10)
            Spacer()
            
            Text(displayAsCurrency(value: exchanges.tradeVolume24HBtc * getCurrentPrice()))
                .frame(width: 125)
                .font(.footnote)
                .foregroundColor(.black)
        }
        .padding(8)
    }
}

struct ExchangesCardView_Previews: PreviewProvider {
    static var cryptoCoinViewModel = { cryptoCoinViewModel in
        cryptoCoinViewModel.fetchData()
        return cryptoCoinViewModel
    } (CryptoCoinViewModel())
    
    static var previews: some View {
        ExchangesCardView(exchanges: Exchanges(id: "binance", name: "Binance", yearEstablished: 2017, country: "Islands", description: "", url: "https://www.binance.com/", image: "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1706864274", hasTradingIncentive: false, trustScore: 10, trustScoreRank: 1, tradeVolume24HBtc: 243053.96170208574, tradeVolume24HBtcNormalized: 148987.6582736287))
            .environmentObject(cryptoCoinViewModel)
    }
}
