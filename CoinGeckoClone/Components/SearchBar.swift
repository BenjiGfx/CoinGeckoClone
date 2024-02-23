//
//  SearchBar.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 22.02.24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool
    var coins: [CryptoCoinModel] 
    
    var body: some View {
        HStack {
            TextField("Search Coins", text: $searchText)
                .padding(.leading, 24)
                .padding(.horizontal, 10)
                .padding(.vertical, 12)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.leading, 10)
                        Spacer()
                        if isSearching {
                            Button(action: {
                                searchText = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .padding(.trailing, 10)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                )
        }
        .onChange(of: searchText) { newValue in //
            isSearching = !searchText.isEmpty
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""), isSearching: .constant(false), coins: [])
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
