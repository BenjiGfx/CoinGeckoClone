//
//  SearchedCoinCardView.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 22.02.24.
//

import SwiftUI

struct SearchedCoinCardView: View {
    
    let cryptoCoins: CryptoCoinModel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: cryptoCoins.image)!) { image in
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
            Text(cryptoCoins.symbol)
                .textCase(.uppercase)
                .foregroundColor(.black).font(.footnote)
        }
        .frame(width: 50)
    }
}


struct SearchedCoinCardView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleCoin = CryptoCoinModel(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400", currentPrice: 42673, marketCap: 837027936813, marketCapRank: 1, fullyDilutedValuation: 895937719042, totalVolume: 18752798176, high24H: 43520, low24H: 42284, priceChange24H: -201.97362076784339, priceChangePercentage24H: -0.47108, marketCapChange24H: -3940893373.8477783, marketCapChangePercentage24H: -0.46861, circulatingSupply: 19619206, totalSupply: 21000000, maxSupply: 21000000, ath: 69045, athChangePercentage: -38.21023, athDate: "2021-11-10T14:24:11.849Z", atl: 67.81, atlChangePercentage: 62815.84738, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2024-02-05T18:04:29.141Z", sparklineIn7D: SparklineIn7D(price: [43014.86733307615, 42971.904926316914]), priceChangePercentage24HInCurrency: -0.47107884992198734)
        
        return SearchedCoinCardView(cryptoCoins: sampleCoin)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding()
    }
}
