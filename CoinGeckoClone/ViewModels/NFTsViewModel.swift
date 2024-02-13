//
//  NFTsViewModel.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 12.02.24.
//

import Foundation
/*
@MainActor
class NFTsViewModel: ObservableObject {
    
    init() {
        
    }
    
    // MARK: Variables
    
    @Published var nfts = [NFTS]()
    
    
    // MARK: Functions
    
    func fetchData() {
        Task {
            do {
                self.nfts = try await fetchNTFS()
                print(self.nfts)
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
    
    
    private func fetchNTFS() async throws -> [NFTS] {
        guard let url = URL(string: "") else {
            throw HTTPError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode([NTFS].self, from: data)
        return result
    }
}
*/
