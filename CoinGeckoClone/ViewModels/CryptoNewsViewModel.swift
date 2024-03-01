//
//  CryptoNewsViewModel.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 26.02.24.
//

import Foundation

@MainActor
class CryptoNewsViewModel: ObservableObject {
    
    init() {
        fetchData()
    }
    
    // MARK: - Variables
    
    @Published var news = initialNewsData
    @Published var newsHistory = [initialNewsData]
    private static let initialNewsData = [
        NewsData(title: "South Korea Regulator & SEC Chair To Discuss Bitcoin ETF & NFTs",
                 description: "In a dynamic intersection of global financial interests, the South Korean regulators and the U.S. financial authorities are set to talk about non-fungible tokens (NFTs), and Bitcoin ETFs. Notably, South Korea’s Financial Supervisory Service (FSS) and the U.S. Securities and Exchange Commission (SEC) are set to engage in crucial deliberations regarding the inclusion of Bitcoin The post South Korea Regulator & SEC Chair To Discuss Bitcoin ETF & NFTs appeared first on CoinGape.",
                 author: "Rupam Roy",
                 url: "https://coingape.com/south-korea-regulator-sec-chair-discuss-bitcoin-etf-nft/",
                 updatedAt: 1708939299,
                 newsSite: "CoinGape",
                 thumb2X: "https://assets.coingecko.com/articles/images/1337996/large/Group-49353-1.jpeg?1708939298")
    ]
    
    // MARK: - Functions
    
    func fetchData() {
        Task {
            do {
                self.news = try await Repository.fetchNews()
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
}

