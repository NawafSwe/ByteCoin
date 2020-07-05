//
//  CurrencyModel.swift
//  ByteCoin
//
//  Created by Nawaf B Al sharqi on 14/11/1441 AH.
//  Copyright © 1441 The App Brewery. All rights reserved.
//

import Foundation

struct CurrencyModel :Codable {
    let rate : Double
    var rateString : String{return String(format: "%.1f", self.rate)}
}
