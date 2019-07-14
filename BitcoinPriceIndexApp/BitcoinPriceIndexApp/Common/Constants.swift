//
//  Constants.swift
//  BitcoinPriceIndexApp
//
//  Created by Stuti on 14/07/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation

enum Constants: String {
    
    case SelectCurrency = "What's your currency?"
    case TodaysPrice = "Today's Bitcoin Price"
    case History = "Historic Data"
    case USD = "USD"
    case GBP = "GBP"
    case Euro = "Euro"
    case EUR = "EUR"
    
    var value: String {
        return self.rawValue
    }
}

struct SelectedCurrency {
    static var code = Constants.USD.value
}
