//
//  Utils.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 29.02.24.
//

import Foundation

func displayAsCurrency(value: Double) -> String {
    let currentVolume = value
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = Locale(identifier: "en_US")
    var formattedVolume = formatter.string(from: NSNumber(value: currentVolume))!
    formattedVolume = String(formattedVolume.dropLast(3)).replacingOccurrences(of: ",", with: ".")
    return formattedVolume
}
