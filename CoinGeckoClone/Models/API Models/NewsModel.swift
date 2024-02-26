//
//  NewsModel.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 26.02.24.
//

import Foundation

struct NewsModel: Codable {
    let data: [NewsData]
}

struct NewsData: Codable{
    
    let title, description: String
    let author: String?
    let url: String
    let updated_at: Int
    let news_site: String
    let thumb_2x: String
}
