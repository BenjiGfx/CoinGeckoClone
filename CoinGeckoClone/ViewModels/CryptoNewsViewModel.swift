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
    
    @Published var news = [NewsData]()
    
    // MARK: - Functions
    
    func fetchData() {
        Task {
            do {
                self.news = try await fetchNews()
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
    
    private func fetchNews() async throws -> [NewsData] {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/news") else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let response = try JSONDecoder().decode(NewsModel.self, from: data)
        
        return response.data
    }
    
}

