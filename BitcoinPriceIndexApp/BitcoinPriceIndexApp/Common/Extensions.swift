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
        layer.cornerRadius = 5.0
        layer.masksToBounds = true
    }
}

//MARK:- UIButton Extension
extension UIButton {
    
    func round() {
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.white.cgColor
        roundCorners()
    }
    
    func set(title: String) {
        setTitle(title, for: .normal)
        round()
    }
    
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.5
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
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
