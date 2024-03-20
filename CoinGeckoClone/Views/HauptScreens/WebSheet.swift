//
//  WebSheet.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 20.03.24.
//

import SwiftUI

struct WebSheet: View {
    
    @EnvironmentObject var exchangesViewModel: ExchangesViewModel
    
    var body: some View {
        VStack {
            Text("Exchanges Web Links")
                .bold()
                .padding(.top)
            Divider()
            ScrollView {
                VStack {
                    ForEach(exchangesViewModel.exchanges) { exchange in
                        if let url = URL(string: exchange.url) {
                            Link(destination: url) {
                                WebSheetCardView(exchanges: exchange)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
        }
    }
}


struct WebSheet_Previews: PreviewProvider {
    static var previews: some View {
        WebSheet()
            .environmentObject(ExchangesViewModel())
    }
}
