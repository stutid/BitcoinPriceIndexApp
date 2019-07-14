//
//  BitcoinVM.swift
//  BitcoinPriceIndexApp
//
//  Created by Stuti on 14/07/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation

protocol UIDelegate: class {
    func updateUI()
}

class BitcoinVM {
    
    //MARK:- Properties
    private let apiManager = ApiManager()
    private let dispatchGroup = DispatchGroup()
    private var currentBPI: CurrentBPI?
    private var historyArray: [(key: String, value: Double)]?
    weak var uidelegate: UIDelegate?
    
    //MARK:- Methods
    init(with currency: String) {
        SelectedCurrency.code = currency
        fetchCurrentBPI()
        fetchHistoricBPI()
        dispatchGroup.notify(queue: .main) {
            self.uidelegate?.updateUI()
        }
    }
    
    func getCurrentBPI() -> String {
        let price = (currentBPI?.price ?? 0.00).roundTwoPlaces()
        return "\(price) \(currentBPI?.code ?? "")"
    }
    
    func getHistoricBPI(at index: Int) -> (String?, String?) {
        let history = historyArray?[index]
        let date = history?.key.stringAsDate()
        let newFormattedDate = date?.dateAsString()
        let price = "\((history?.value ?? 0.00).roundTwoPlaces()) \(SelectedCurrency.code)"
        return (newFormattedDate, price)
    }
    
    func getHistoricBPICount() -> Int {
        return historyArray?.count ?? 0
    }
    
    //MARK:- API calls
    private func fetchCurrentBPI() {
        dispatchGroup.enter()
        let newurl = (URLConstants.Price.currentPrice.url).replacingOccurrences(of: "%@", with: SelectedCurrency.code)
        let url = URL(string: newurl)
        apiManager.fetch(url: url!) { [weak self] (data, error) in
            guard let data = data else { return }
            do {
                let jsonDict = try JSONDecoder().decode(CurrentBPI.self, from: data)
                self?.currentBPI = jsonDict
                self?.dispatchGroup.leave()
            } catch {
            }
        }
    }
    
    private func fetchHistoricBPI() {
        dispatchGroup.enter()
        let newurl = (URLConstants.Price.historyPrice.url).replacingOccurrences(of: "%@", with: SelectedCurrency.code)
        let url = URL(string: newurl)
        apiManager.fetch(url: url!) { [weak self] (data, error) in
            guard let data = data else { return }
            do {
                self?.historyArray?.removeAll()
                let jsonDict = try JSONDecoder().decode(HistoricBPI.self, from: data)
                self?.historyArray = jsonDict.bpi?.sorted(by: { $0.0 > $1.0 })
                self?.dispatchGroup.leave()
            } catch {
            }
        }
    }
}
