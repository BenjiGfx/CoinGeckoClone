//
//  Screen5.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 06.02.24.
//

import SwiftUI

struct News: View {
    
    @StateObject private var newsViewModel = CryptoNewsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("News")
                    .bold()
                Spacer()
                ScrollView {
                    VStack {
                        ForEach(newsViewModel.news, id: \.url) { new in
                            NavigationLink(destination: NewsDetailView(news: new)) {
                                NewsCardView(news: new)
                                    .frame(alignment: .leading)
                            }
                        }
                    }
                    .onAppear {
                        newsViewModel.fetchData()
                    }
                }
                .background(Color.clear)
            }
        }
    }
}

struct News_Previews: PreviewProvider {
    static var previews: some View {
        News()
    }
}

