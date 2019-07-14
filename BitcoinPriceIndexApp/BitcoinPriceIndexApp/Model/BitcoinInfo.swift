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
    
    struct JSONKey: CodingKey {
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        
        var intValue: Int? { return nil }
        init?(intValue: Int) { return nil }
        
        static let bpi = JSONKey(stringValue: "bpi")!
        static let code = JSONKey(stringValue: "code")!
        static let price = JSONKey(stringValue: "rate_float")!
        static let symbol = JSONKey(stringValue: "symbol")!
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        let bpi = try container.nestedContainer(keyedBy: JSONKey.self, forKey: .bpi)
        let nameKey = JSONKey(stringValue: SelectedCurrency.code)!
        let currency = try bpi.nestedContainer(keyedBy: JSONKey.self, forKey: nameKey)
        code = try currency.decodeIfPresent(String.self, forKey: .code)
        price = try currency.decodeIfPresent(Double.self, forKey: .price)
        symbol = try currency.decodeIfPresent(String.self, forKey: .symbol)
    }
}

struct HistoricBPI: Decodable {
    let bpi: [String: Double]?
}
