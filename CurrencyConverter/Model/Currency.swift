//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Никита on 9.02.22.
//

import Foundation
import UIKit

struct Currency {
    var moneySum: Double!
    var typeCurrency: String!
    var imageFlagView: String!
    var currencyExchange: Double!
    var boolFlag: Bool!
    
    init () {}
    
    init (moneySumM: Double, typeCurrencyM: String, boolFlagM: Bool) {
        self.moneySum = moneySumM
        self.typeCurrency = typeCurrencyM
        self.boolFlag = boolFlagM
    }
    
    init (moneySumM: Double, typeCurrencyM: String, imageFlagViewM: String, currencyExchangeM: Double, boolFlagM: Bool) {
        self.moneySum = moneySumM
        self.typeCurrency = typeCurrencyM
        self.imageFlagView = imageFlagViewM
        self.currencyExchange = currencyExchangeM
        self.boolFlag = boolFlagM
    }
    
    
    
}
