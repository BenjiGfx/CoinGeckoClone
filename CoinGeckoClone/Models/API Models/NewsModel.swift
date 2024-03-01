//
//  NewsModel.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 26.02.24.
//

import Foundation

struct NewsModel: Codable {
    let data: [NewsData]
    
    enum CodingKeys: String, CodingKey {
       case data
    }
}

struct NewsData: Codable {
    
    let title: String
    let description: String
    let author: String?
    let url: String
    let updatedAt: Int
    let newsSite: String
    let thumb2X: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case author
        case url
        case updatedAt = "updated_at"
        case newsSite = "news_site"
        case thumb2X = "thumb_2x"
    }
}
