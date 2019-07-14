//
//  BitcoinVC.swift
//  BitcoinPriceIndexApp
//
//  Created by Stuti on 14/07/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit

class BitcoinVC: UIViewController {
    
    //MARK:- Outlets and Properties
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var historyView: UIView!
    @IBOutlet weak var historyLbl: UILabel!
    @IBOutlet weak var historyTblView: UITableView!
    var bitcoinVM: BitcoinVM!
    
    //MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        bitcoinVM.uidelegate = self
        headerLbl.text = Constants.TodaysPrice.value
        historyView.roundCorners()
        historyLbl.text = Constants.History.value
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

//MARK:- UITableView DataSource methods
extension BitcoinVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HistoryCell.className) as? HistoryCell else { return UITableViewCell() }
        let (date, price) = bitcoinVM.getHistoricBPI(at: indexPath.row)
        cell.set(date, and: price)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bitcoinVM.getHistoricBPICount()
    }
}

//MARK:- UIDelegate Extension
extension BitcoinVC: UIDelegate {
    
    func updateUI() {
        priceLbl.text = bitcoinVM.getCurrentBPI()
        historyTblView.reloadData()
    }
}
