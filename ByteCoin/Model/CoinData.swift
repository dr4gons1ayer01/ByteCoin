//
//  CoinData.swift
//  ByteCoin
//
//  Created by Иван Семенов on 14.03.2024.
//

import Foundation

// MARK: - CoinData
struct CoinData: Codable {
    let time, assetIDBase, assetIDQuote: String
    let rate: Double

    enum CodingKeys: String, CodingKey {
        case time
        case assetIDBase = "asset_id_base"
        case assetIDQuote = "asset_id_quote"
        case rate
    }
}
