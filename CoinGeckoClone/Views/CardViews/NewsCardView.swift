//
//  NewsCardView.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 26.02.24.
//

import SwiftUI

struct NewsCardView: View {
    
    let news: NewsData
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: news.thumb_2x)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .frame(maxWidth: 100, maxHeight: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                case .failure(_):
                    Image(systemName: "xmark.icloud")
                        .foregroundColor(.red)
                        .frame(maxWidth: 100, minHeight: 100)
                        .font(.largeTitle)

                case .empty:
                    Text("Loading...")
                @unknown default:
                    EmptyView()
                }
            }
            VStack {
                Text(news.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.black)
                Spacer()
                    Text(news.news_site)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.footnote)
                        .foregroundColor(.gray)
            }
        }
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
        .padding()
        .shadow(radius: 5)
        .frame(maxHeight: 150)
    }
}


struct NewsCardView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCardView(news:
            NewsData(title: "South Korea Regulator & SEC Chair To Discuss Bitcoin ETF & NFTs",
                     description: "In a dynamic intersection of global financial interests, the South Korean regulators and the U.S. financial authorities are set to talk about non-fungible tokens (NFTs), and Bitcoin ETFs. Notably, South Korea’s Financial Supervisory Service (FSS) and the U.S. Securities and Exchange Commission (SEC) are set to engage in crucial deliberations regarding the inclusion of Bitcoin The post South Korea Regulator & SEC Chair To Discuss Bitcoin ETF & NFTs appeared first on CoinGape.",
                     author: "Rupam Roy",
                     url: "https://coingape.com/south-korea-regulator-sec-chair-discuss-bitcoin-etf-nft/",
                     updated_at: 1708939299,
                     news_site: "CoinGape",
                     thumb_2x: "https://assets.coingecko.com/articles/images/1337996/large/Group-49353-1.jpeg?1708939298")
        )
    }
}

