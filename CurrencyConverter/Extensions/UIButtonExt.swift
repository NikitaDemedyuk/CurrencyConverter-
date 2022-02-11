//
//  UIButtonExt.swift
//  CurrencyConverter
//
//  Created by Никита on 11.02.22.
//

import UIKit

extension UIButton {
    
    func setSelectColorBtnSelect() {
        self.backgroundColor = #colorLiteral(red: 0, green: 0.8559800982, blue: 0.4731212854, alpha: 1)
    }
    
    func setDeselectColorBtnSelect() {
        self.backgroundColor = #colorLiteral(red: 0.576599896, green: 0.9052171111, blue: 0.734284699, alpha: 1)
    }
    
    func setSelectColorBtnCur() {
        self.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
    }
    
    func setDeselectColorBtnCur() {
        self.backgroundColor = #colorLiteral(red: 0.8575454354, green: 0.8185300231, blue: 0, alpha: 1)
    }
}
