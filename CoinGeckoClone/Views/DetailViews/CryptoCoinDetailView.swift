//
//  CryptoCoinDetailView.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 05.02.24.
//

import SwiftUI

struct CryptoCoinDetailView: View {
    
    let coin: CryptoCoinModel
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
                
                NavigationLink(destination: PriceChartDetailView(coin: coin)) {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color.cyan)
                        .cornerRadius(10)
                }
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
            .shadow(radius: 5)
        }
        .onAppear {
            stringList.removeAll()
            dataList.removeAll()
            // Market Cap Rank wird der Liste hinzugefügt
            stringList.append("Market Cap Rank")
            dataList.append("#" + coin.rank.description)
            
            // Market Cap wird der Liste hinzugefügt
            stringList.append("Market Cap")
            if let marketCap = coin.marketCap {
                let formatter = NumberFormatter()
                formatter.groupingSeparator = "."
                formatter.numberStyle = .decimal
                
                if let formattedMarketCap = formatter.string(from: NSNumber(value: marketCap)) {
                    dataList.append("$\(formattedMarketCap)")
                } else {
                    dataList.append("N/V")
                }
            } else {
                dataList.append("N/V")
            }
            
            // Fully Diluted Valuation wird der Liste hinzugefügt
            stringList.append("Fully Diluted Valuation")
            if let fullyDilutedValuation = coin.fullyDilutedValuation {
                let formatter = NumberFormatter()
                formatter.groupingSeparator = "."
                formatter.numberStyle = .decimal
                
                if let formattedValue = formatter.string(from: NSNumber(value: fullyDilutedValuation)) {
                    dataList.append("$\(formattedValue)")
                } else {
                    dataList.append("N/V")
                }
            } else {
                dataList.append("N/V")
            }
            
            // Market Cap / FDV Ratio wird der Liste hinzugefügt
            stringList.append("Market Cap / FDV Ratio")
            dataList.append(coin.marketCapChangePercentage24H?.description ?? "N/V")
            
            // Trading Volume wird der Liste hinzugefügt
            stringList.append("Trading Volume")
            if let totalVolume = coin.totalVolume {
                let formatter = NumberFormatter()
                formatter.groupingSeparator = "."
                formatter.numberStyle = .decimal
                
                if let formattedValue = formatter.string(from: NSNumber(value: totalVolume)) {
                    dataList.append("$\(formattedValue)")
                } else {
                    dataList.append("N/V")
                }
            } else {
                dataList.append("N/V")
            }
            
            // 24H High wird der Liste hinzugefügt
            stringList.append("24H High")
            if let high24H = coin.high24H {
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                formatter.maximumFractionDigits = 0
                
                if let formattedValue = formatter.string(from: NSNumber(value: high24H)) {
                    dataList.append("$\(formattedValue)")
                } else {
                    dataList.append("N/V")
                }
            } else {
                dataList.append("N/V")
            }
            
            // 24H Low wird der Liste hinzugefügt
            stringList.append("24H Low")
            if let low24H = coin.low24H {
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                formatter.maximumFractionDigits = 0
                
                if let formattedValue = formatter.string(from: NSNumber(value: low24H)) {
                    dataList.append("$\(formattedValue)")
                } else {
                    dataList.append("N/V")
                }
            } else {
                dataList.append("N/V")
            }
            
            // Circulating Supply wird der Liste hinzugefügt
            stringList.append("Circulating Supply")
            if let circulatingSupply = coin.circulatingSupply {
                let millionValue = circulatingSupply / 1_000_000
                let formattedValue = String(format: "%.1f Millionen", millionValue)
                dataList.append(formattedValue)
            } else {
                dataList.append("N/V")
            }
            
            // Total Supply wird der Liste hinzugefügt
            stringList.append("Total Supply")
            if let totalSupply = coin.totalSupply {
                let totalSupplyNumber = Double(totalSupply) / 1000000.0
                let formattedTotalSupply = String(format: "%.1f Millionen", totalSupplyNumber)
                dataList.append(formattedTotalSupply)
            } else {
                dataList.append("N/V")
            }
            
            // Max Supply wird der Liste hinzugefügt
            stringList.append("Max Supply")
            if let totalSupply = coin.maxSupply {
                let totalSupplyNumber = Double(totalSupply) / 1000000.0
                let formattedTotalSupply = String(format: "%.1f Millionen", totalSupplyNumber)
                dataList.append(formattedTotalSupply)
            } else {
                dataList.append("N/V")
            }
            
            // All-Time-High wird der Liste hinzugefügt
            stringList.append("All-Time-High")
            if let ath = coin.ath {
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                formatter.maximumFractionDigits = 0
                
                if let formattedValue = formatter.string(from: NSNumber(value: ath)) {
                    dataList.append("$\(formattedValue)")
                } else {
                    dataList.append("N/V")
                }
            } else {
                dataList.append("N/V")
            }
            
            // All-Time-Low wird der Liste hinzugefügt
            stringList.append("All-Time-Low")
            if let atl = coin.atl {
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                formatter.maximumFractionDigits = 0
                
                if let formattedValue = formatter.string(from: NSNumber(value: atl)) {
                    dataList.append("$\(formattedValue)")
                } else {
                    dataList.append("N/V")
                }
            } else {
                dataList.append("N/V")
            }
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
