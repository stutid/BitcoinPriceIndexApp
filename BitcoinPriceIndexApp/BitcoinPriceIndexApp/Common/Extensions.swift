//
//  Extensions.swift
//  BitcoinPriceIndexApp
//
//  Created by Stuti on 14/07/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit

//MARK:- NSObject Extension
extension NSObject {
    
    class var className: String {
        return String(describing: self)
    }
}

//MARK:- UIView Extension
extension UIView {
    
    func roundCorners() {
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
    }
}

//MARK:- Double Extension
extension Double {
    
    func roundTwoPlaces() -> String {
        return String(format:"%.2f", self)
    }
}

//MARK:- Date Extension
extension Date {
    
    func dateAsString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM, YYYY"
        let dateString = formatter.string(from: self)
        return dateString
    }
}

//MARK:- String Extension
extension String {
    
    func stringAsDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        let date = formatter.date(from: self)
        return date
    }
}
