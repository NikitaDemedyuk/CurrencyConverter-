//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Никита on 9.02.22.
//

import Foundation
import UIKit

struct Currency {
    var typeCurrency: String!
    var imageFlagView: String!
    var currencyExchange: Double!
    var boolFlag: Bool!
    
    init () {}
    
    init (typeCurrencyM: String, imageFlagViewM: String, currencyExchangeM: Double, boolFlagM: Bool) {
        self.typeCurrency = typeCurrencyM
        self.imageFlagView = imageFlagViewM
        self.currencyExchange = currencyExchangeM
        self.boolFlag = boolFlagM
    }
    
    
    
}
