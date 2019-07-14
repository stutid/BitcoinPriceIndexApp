//
//  DashboardVM.swift
//  BitcoinPriceIndexApp
//
//  Created by Stuti on 14/07/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation

class DashboardVM {
    
    //MARK:- Methods
    func checkCode(for currency: String) -> String {
        var currencyCode = currency
        if currency == Constants.Euro.value {
            currencyCode = Constants.EUR.value
        }
        return currencyCode
    }
}
