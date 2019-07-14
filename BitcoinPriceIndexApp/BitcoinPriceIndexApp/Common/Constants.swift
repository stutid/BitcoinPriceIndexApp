//
//  Constants.swift
//  BitcoinPriceIndexApp
//
//  Created by Stuti on 14/07/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation

enum Constants: String {
    
    case TodaysPrice = "Today's Bitcoin Price"
    case History = "Historic Data"
    case USD = "USD"
    
    var value: String {
        return self.rawValue
    }
}
