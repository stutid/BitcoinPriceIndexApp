//
//  BitcoinInfo.swift
//  BitcoinPriceIndexApp
//
//  Created by Stuti on 14/07/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation

struct CurrentBPI: Decodable {
    let code: String?
    let price: Double?
    let symbol: String?
    
    private enum CodingKeys: String, CodingKey {
        case code
        case price = "rate_float"
        case symbol
        case bpi
        case usd = "USD"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let bpi = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .bpi)
        let usd = try bpi.nestedContainer(keyedBy: CodingKeys.self, forKey: .usd)
        code = try usd.decodeIfPresent(String.self, forKey: .code)
        price = try usd.decodeIfPresent(Double.self, forKey: .price)
        symbol = try usd.decodeIfPresent(String.self, forKey: .symbol)
    }
}

struct HistoricBPI: Decodable {
    let bpi: [String: Double]?
}
