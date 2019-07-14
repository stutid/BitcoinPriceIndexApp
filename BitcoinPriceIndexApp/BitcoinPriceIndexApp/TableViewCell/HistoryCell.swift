//
//  HistoryCell.swift
//  BitcoinPriceIndexApp
//
//  Created by Stuti on 14/07/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    
    func set(_ date: String?, and price: String?) {
        titleLbl.text = date
        subtitleLbl.text = price
    }
}
