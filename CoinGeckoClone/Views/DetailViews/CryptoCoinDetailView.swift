//
//  CryptoCoinDetailView.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 05.02.24.
//

import SwiftUI

struct CryptoCoinDetailView: View {
    
    let coin: CryptoCoinModel
//    var coinDataList = [[String: String]]()
    @State var stringList = [String]()
    @State var dataList = [String]()
    
    var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(String(format: "$%.2f", coin.currentPrice))
                        .font(.largeTitle)
                        .bold()
                    Text(String(format: "%.2f%%", coin.priceChangePercentage24H ?? 0))
                        .foregroundColor(coin.priceChangePercentage24H ?? 0 > 0 ? .green : .red)
                        .font(.subheadline)
                        .bold()
                }
                List(stringList.indices, id: \.self) { index in
                    HStack{
                        Text(stringList[index])
                            .font(.footnote)
                            .foregroundColor(.gray)
                        Spacer()
                        Text(dataList[index])
                            .font(.footnote)
                            .foregroundColor(.black)
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .background(
            Image("big_background")
                .opacity(0.2)
            )
            .onAppear {
                stringList.append("Market Cap Rank")
                dataList.append(coin.rank.description)
                stringList.append("Market Cap")
                dataList.append(coin.marketCap?.description ?? "N/V")
            }
            .padding(.horizontal)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    AsyncImage(url: URL(string: coin.image)!) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Image(systemName: "bitcoinsign.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding()
                    }
                    .frame(width: 30, height: 30)
                    .padding(.horizontal)
                    Text(coin.name)
                    Text("(\(coin.symbol))")
                        .textCase(.uppercase)
                        .foregroundColor(.gray)
                }
                .font(.footnote)
            }
        }
    }
}

struct CryptoCoinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleCoin = CryptoCoinModel(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400", currentPrice: 42673, marketCap: 837027936813, marketCapRank: 1, fullyDilutedValuation: 895937719042, totalVolume: 18752798176, high24H: 43520, low24H: 42284, priceChange24H: -201.97362076784339, priceChangePercentage24H: -0.47108, marketCapChange24H: -3940893373.8477783, marketCapChangePercentage24H: -0.46861, circulatingSupply: 19619206, totalSupply: 21000000, maxSupply: 21000000, ath: 69045, athChangePercentage: -38.21023, athDate: "2021-11-10T14:24:11.849Z", atl: 67.81, atlChangePercentage: 62815.84738, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2024-02-05T18:04:29.141Z", sparklineIn7D: SparklineIn7D(price: [43014.86733307615, 42971.904926316914]), priceChangePercentage24HInCurrency: -0.47107884992198734)
        
        return CryptoCoinDetailView(coin: exampleCoin)
    }
}
