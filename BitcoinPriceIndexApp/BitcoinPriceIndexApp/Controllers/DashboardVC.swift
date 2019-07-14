//
//  DashboardVC.swift
//  BitcoinPriceIndexApp
//
//  Created by Stuti on 14/07/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {
    
    //MARK:- Outlets and Properties
    @IBOutlet weak var selectCurrencyLbl: UILabel!
    @IBOutlet var currencyBtns: [UIButton]!
    private var dashboardVM = DashboardVM()
    
    //MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        selectCurrencyLbl.text = Constants.SelectCurrency.value
        for btn in currencyBtns {
            btn.round()
        }
    }
    
    @IBAction func btnClicked(_ sender: UIButton) {
        sender.pulsate()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.navigateToVC(for: sender.currentTitle ?? "")
        }
    }
    
    private func navigateToVC(for currency: String) {
        guard let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: BitcoinVC.className) as? BitcoinVC else { return }
        let currencyCode = dashboardVM.checkCode(for: currency)
        VC.bitcoinVM = BitcoinVM(with: currencyCode)
        navigationController?.pushViewController(VC, animated: true)
    }
}
