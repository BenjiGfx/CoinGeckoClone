//
//  CoinPicker.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 18.02.24.
//

import SwiftUI

struct CoinPicker: View {
    
    @EnvironmentObject var coinData: CryptoCoinViewModel
    
    @State private var firstselectedCoin: CryptoCoinModel?
    @State private var secondselectedCoin: CryptoCoinModel?
    
    var body: some View {
        VStack {
            Text("Currency Converter")
                .bold()
            Spacer()
            HStack {
                VStack {
                    Picker("First Select Coin", selection: $firstselectedCoin) {
                        ForEach(coinData.coinData, id: \.id) { coin in
                            HStack {
                                AsyncImage(url: URL(string: coin.image)!) { image in
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
                                Text("\(coin.symbol)")
                                    .textCase(.uppercase)
                                    .bold()
                            }
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 150)
                }
                
                Spacer()
                
                Picker("Second Select Coin", selection: $secondselectedCoin) {
                    ForEach(coinData.coinData, id: \.id) { coin in
                        HStack {
                            AsyncImage(url: URL(string: coin.image)!) { image in
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
                            Text("\(coin.symbol)")
                                .textCase(.uppercase)
                                .bold()
                        }
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 150)
                Spacer()
            }
            Spacer()
                
        }
    }
}

struct CoinPicker_Previews: PreviewProvider {
    static var previews: some View {
        CoinPicker()
            .environmentObject(CryptoCoinViewModel())
    }
}
