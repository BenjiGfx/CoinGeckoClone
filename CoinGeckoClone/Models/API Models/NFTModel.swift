//
//  NFTModel.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 12.02.24.
//

import Foundation

// MARK: - NFTS
struct NFTS: Codable {
    let response: String
    let nft: NFT
    let owner: String
    let contract: Contract
}

// MARK: - Contract
struct Contract: Codable {
    let name, symbol, type: String
    let metadata: ContractMetadata
}

// MARK: - ContractMetadata
struct ContractMetadata: Codable {
    let description: String
    let thumbnail_url: String
    let cached_thumbnail_url: String?
    let banner_url: String
    let cached_banner_url: String?
}

// MARK: - Nft
struct NFT: Codable {
    let chain, contract_address, token_id: String
    let metadata_url: String
    let metadata: NftMetadata
    let file_information: String?
    let file_url: String
    let animation_url: String?
    let cached_file_url: String
    let cached_animation_url: String?
    let creator_address: String
    let mint_date: String?
    let updated_date: String
}

// MARK: - NftMetadata
struct NftMetadata: Codable {
    let image: String
    let attributes: [Attribute]
}

// MARK: - Attribute
struct Attribute: Codable {
    let value, trait_type: String
}
