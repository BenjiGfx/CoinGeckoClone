//
//  PriceChartDetailView.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 15.02.24.
//

import SwiftUI

struct PriceChartDetailView: View {
    
    @State private var isChartViewDisplayed = true
    
    let coin: CryptoCoinModel
    @StateObject private var dailyTFviewModel = DailyTFViewModel()
    
    var body: some View {
        VStack {
            Text("Price Chart")
                .bold()
            VStack (alignment: .leading) {
                VStack(alignment: .leading) {
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
                        Text(coin.name)
                        Text("(\(coin.symbol))")
                            .textCase(.uppercase)
                            .foregroundColor(.gray)
                    }
                    .font(.footnote)
                    HStack {
                        Text(String(format: "$%.2f", coin.currentPrice))
                            .font(.largeTitle)
                            .bold()
                        Text(String(format: "%.2f%% ", coin.priceChangePercentage24H ?? 0))
                            .foregroundColor(coin.priceChangePercentage24H ?? 0 > 0 ? .green : .red)
                            .font(.subheadline)
                            .bold()
                        +
                        Text("/ 24H")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                }
                .padding()
                if isChartViewDisplayed {
                                    ChartView(coin: coin) // Show ChartView
                                } else {
                                    DailyTFChartView(coin: dailyTFviewModel.getPrices(id: coin.id)) // Show DailyTFChartView
                                }
                                Spacer()
                                Button(action: {
                                    isChartViewDisplayed.toggle() // Toggle between ChartView and DailyTFChartView
                                }) {
                                    Text(isChartViewDisplayed ? "Show DailyTF Chart" : "Show Regular Chart") // Change button text based on displayed chart
                                }
                Spacer()
            }
        }
    }
}

struct PriceChartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PriceChartDetailView(coin: CryptoCoinModel(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400", currentPrice: 42673, marketCap: 837027936813, marketCapRank: 1, fullyDilutedValuation: 895937719042, totalVolume: 18752798176, high24H: 43520, low24H: 42284, priceChange24H: -201.97362076784339, priceChangePercentage24H: -0.47108, marketCapChange24H: -3940893373.8477783, marketCapChangePercentage24H: -0.46861, circulatingSupply: 19619206, totalSupply: 21000000, maxSupply: 21000000, ath: 69045, athChangePercentage: -38.21023, athDate: "2021-11-10T14:24:11.849Z", atl: 67.81, atlChangePercentage: 62815.84738, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2024-02-05T18:04:29.141Z", sparklineIn7D: SparklineIn7D(price: [
            42737.6877283457,
            42721.46967177302,
            42846.80186151075,
            43004.27546014842,
            42944.448455297264,
            42690.289094638356,
            42774.79608632523,
            42723.419015041574,
            42825.38981509417,
            42901.7730566995,
            43173.071994471225,
            43159.08282498484,
            43148.629429965054,
            43179.1990451119,
            43234.629759800584,
            43095.09421577959,
            43164.97405180333,
            43179.44428682067,
            43077.87001901176,
            43074.242640733275,
            43032.15128532877,
            43042.26931285388,
            42758.55528523976,
            42893.0986393637,
            42992.85768674611,
            42909.248040490886,
            42864.21170418184,
            42905.79050990208,
            43122.854985745675,
            42798.245423237044,
            42897.892323200984,
            43052.731971294175,
            43135.973703668016,
            42966.833349300636,
            43034.866152885195,
            43162.119337812175,
            43513.20439556491,
            43616.5097280803,
            43605.83223615377,
            44123.20668906271,
            44175.60349363787,
            44164.5533723649,
            44317.87047199724,
            44535.459097334475,
            44692.237424902734,
            44600.210796424835,
            44524.25431658259,
            44467.40053883225,
            44524.25714149837,
            44452.11281955727,
            44497.219989593905,
            44702.75210595903,
            44675.607176241014,
            44803.27768024157,
            44736.32097433638,
            44639.75388704938,
            44948.79579131514,
            45057.50408054458,
            45429.621585429595,
            45087.34461153776,
            45013.30822484713,
            45289.3559421022,
            45303.658354175364,
            45481.628337707705,
            45387.05257085574,
            45333.15905379783,
            45305.60747479472,
            45306.96795859608,
            45507.35570112257,
            46324.980541105404,
            46079.02653391586,
            45920.452964727694,
            46255.02217878857,
            46201.31934671629,
            46208.825156678795,
            46620.60992278284,
            46541.232947522585,
            46779.6823084854,
            47148.2062972647,
            47329.92481313396,
            47472.49923383006,
            47075.576436758914,
            47140.55546969623,
            47251.936294324056,
            47611.95347474529,
            47575.17502052522,
            47500.92792281298,
            47513.15103858787,
            47562.40003746312,
            47299.255913029054,
            47150.94268312061,
            47086.70263093229,
            47310.251582312885,
            47346.005416037005,
            47372.34513644432,
            47416.46683285779,
            47351.395357424575,
            47370.84800867957,
            47199.65725138492,
            47114.72449075292,
            47090.52224718451,
            46909.82392439771,
            47113.74168894777,
            47270.150413361596,
            47325.5464635559,
            47299.02344953918,
            47371.36468280237,
            47273.65117540411,
            47216.158149094,
            47353.092648598846,
            47575.049935938594,
            48001.47445329455,
            47946.23389258916,
            47842.76752457509,
            47768.995251247936,
            47734.86375258085,
            47666.08776947053,
            47765.46452032612,
            48487.28488686649,
            48306.653867189765,
            48254.20913483157,
            48235.25429846169,
            48199.19902013254,
            48118.349006317854,
            48145.279472087794,
            48136.51968009445,
            48417.602142002615,
            48363.86350725783,
            48079.09955352912,
            48258.758233187895,
            48160.70126977255,
            48115.23339460549,
            48297.08125202173,
            48292.53012447849,
            48289.70137608725,
            48022.520844903804,
            48124.846152082006,
            48121.6710728603,
            48295.94142975283,
            48606.30845000913,
            48425.43980915871,
            48159.95917172604,
            48145.837435793685,
            48074.007757268766,
            48099.09377747076,
            48152.29440900928,
            48215.67103337655,
            48099.80775410864,
            47897.30018686105,
            47882.16390173216,
            47897.41188630087,
            48028.09402798914,
            47945.770863866004,
            48782.48495602798,
            49941.552886191246,
            49604.36550191753,
            49888.15529443975,
            49739.09440743221,
            49590.25844986223,
            50159.17591243684,
            49846.6723797357,
            50006.42477417,
            49962.40900520193,
            50089.13897437323,
            50162.57586962115,
            49974.99397491876,
            49783.43791696859,
            49918.500051164876]), priceChangePercentage24HInCurrency: -0.47107884992198734))
    }
}

