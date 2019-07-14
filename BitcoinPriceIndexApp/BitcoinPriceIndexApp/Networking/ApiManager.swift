//
//  ApiManager.swift
//  BitcoinPriceIndexApp
//
//  Created by Stuti on 14/07/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation

final class ApiManager {
    
    private let session = URLSession.shared
    
    func fetch(url: URL, completionHandler: @escaping (Data?, Error?) -> ()) {
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completionHandler(nil, error)
            }
            
            if let data = data {
                completionHandler(data, nil)
            }
        }
        task.resume()
    }
}
