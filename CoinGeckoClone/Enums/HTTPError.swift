//
//  HTTPError.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 05.02.24.
//

import Foundation

enum HTTPError: Error {
    case invalidURL
    case missingData
}
