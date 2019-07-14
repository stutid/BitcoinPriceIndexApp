//
//  URLConstants.swift
//  BitcoinPriceIndexApp
//
//  Created by Stuti on 14/07/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation

enum URLConstants {
    
    private static let BASE_URL = "https://api.coindesk.com/v1/bpi/"
    
    enum Price {
        case currentPrice, historyPrice
        
        var url: String {
            return "\(BASE_URL)\(endPoint)"
        }
        
        private var endPoint: String {
            switch self {
            case .currentPrice:
                return "currentprice/USD.json"
            case .historyPrice:
                return "historical/close.json"
            }
        }
    }
}
