//
//  NewsDetailView.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 26.02.24.
//

import SwiftUI

struct NewsDetailView: View {
    
    let news: NewsData
    
    var body: some View {
        ScrollView {
            VStack {
                Text(news.title)
                    .font(.title)
                    .bold()
                AsyncImage(url: URL(string: news.thumb2X)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    case .failure(_):
                        Image(systemName: "xmark.icloud")
                            .foregroundColor(.red)
                            .font(.largeTitle)
                    case .empty:
                        Text("Loading...")
                    @unknown default:
                        EmptyView()
                    }
                }
                Divider()
                Text(news.description)
                    .font(.subheadline)
                Text(news.author ?? "N/V")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .bold()
                Spacer()
                Button(action: {
                    if let url = URL(string: news.url) {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Text("Full Article")
                }
            }
            .padding()
        }
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(news:
                        NewsData(title: "South Korea Regulator & SEC Chair To Discuss Bitcoin ETF & NFTs",
                                 description: "In a dynamic intersection of global financial interests, the South Korean regulators and the U.S. financial authorities are set to talk about non-fungible tokens (NFTs), and Bitcoin ETFs. Notably, South Korea’s Financial Supervisory Service (FSS) and the U.S. Securities and Exchange Commission (SEC) are set to engage in crucial deliberations regarding the inclusion of Bitcoin The post South Korea Regulator & SEC Chair To Discuss Bitcoin ETF & NFTs appeared first on CoinGape.",
                                 author: "Rupam Roy",
                                 url: "https://coingape.com/south-korea-regulator-sec-chair-discuss-bitcoin-etf-nft/",
                                 updatedAt: 1708939299,
                                 newsSite: "CoinGape",
                                 thumb2X: "https://assets.coingecko.com/articles/images/1337996/large/Group-49353-1.jpeg?1708939298")
        )
    }
}
