//
//  VC2.swift
//  CurrencyConverter
//
//  Created by Никита on 9.02.22.
//

import UIKit

class VC2: UIViewController {

    var money1: Currency!
    
    var money2: Currency!
    
    var segueIdentifier:String?
    
    @IBOutlet weak var BYNBtn: UIButton!
    
    @IBOutlet weak var RUSBtn: UIButton!
    
    @IBOutlet weak var USDBtn: UIButton!
    
    @IBOutlet weak var EURBtn: UIButton!
    
    @IBOutlet weak var selectBtn: UIButton!
    
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onBYNTapped(_ sender: Any) {
        BYNBtn.setSelectColorBtnCur()
        RUSBtn.setDeselectColorBtnCur()
        USDBtn.setDeselectColorBtnCur()
        EURBtn.setDeselectColorBtnCur()
        
        if segueIdentifier == "selCur1" {
            money1.typeCurrency = "BYN"
            money1.imageFlagView = "BYNFlag"
            money1.currencyExchange = 8.0
        }
        
        if segueIdentifier == "selCur2" {
            money2.typeCurrency = "BYN"
            money2.imageFlagView = "BYNFlag"
            money2.currencyExchange = 8.0
        }
    }
    
    @IBAction func onRUSTapped(_ sender: Any) {
        BYNBtn.setDeselectColorBtnCur()
        RUSBtn.setSelectColorBtnCur()
        USDBtn.setDeselectColorBtnCur()
        EURBtn.setDeselectColorBtnCur()
        
        
        if segueIdentifier == "selCur1" {
            money1.typeCurrency = "RUS"
            money1.imageFlagView = "RUSFlag"
            money1.currencyExchange = 5.0
        }
        
        if segueIdentifier == "selCur2" {
            money2.typeCurrency = "RUS"
            money2.imageFlagView = "RUSFlag"
            money2.currencyExchange = 5.0
        }
    }
    
    @IBAction func onUSDTapped(_ sender: Any) {
        BYNBtn.setDeselectColorBtnCur()
        RUSBtn.setDeselectColorBtnCur()
        USDBtn.setSelectColorBtnCur()
        EURBtn.setDeselectColorBtnCur()
        
        if segueIdentifier == "selCur1" {
            money1.typeCurrency = "USD"
            money1.imageFlagView = "USDFlag"
            money1.currencyExchange = 2.5
        }
        
        if segueIdentifier == "selCur2" {
            money2.typeCurrency = "USD"
            money2.imageFlagView = "USDFlag"
            money2.currencyExchange = 2.5
        }
    }
    
    @IBAction func onEURTapped(_ sender: Any) {
        
        BYNBtn.setDeselectColorBtnCur()
        RUSBtn.setDeselectColorBtnCur()
        USDBtn.setDeselectColorBtnCur()
        EURBtn.setSelectColorBtnCur()
        
        if segueIdentifier == "selCur1" {
            money1.typeCurrency = "EUR"
            money1.imageFlagView = "EURFlag"
            money1.currencyExchange = 2.0
        }
        
        if segueIdentifier == "selCur2" {
            money2.typeCurrency = "EUR"
            money2.imageFlagView = "EURFlag"
            money2.currencyExchange = 2.0
        }
    }
    
    typealias Closure = (String) -> ()
    
    typealias ClosureDouble = (Double) -> ()
    
    var dataClosure: Closure?
    var dataClosure2: Closure?
    
    var flagClosure: Closure?
    var flagClosure2: Closure?
    
    var doubleCurClosureM1: ClosureDouble?
    var doubleCurClosureM2: ClosureDouble?

    @IBAction func selectBtnPressed(_ sender: Any) {
        
            
        if money1.typeCurrency != nil {
        
            selectBtn.setSelectColorBtnSelect()
            
            dataClosure?(money1.typeCurrency)
            
            flagClosure?(money1.imageFlagView)
            
            doubleCurClosureM1?(money1.currencyExchange)
            
            dismiss(animated: true, completion: nil)
        
        }
        
        if money2.typeCurrency != nil {
           
            selectBtn.setSelectColorBtnSelect()
            
            dataClosure2?(money2.typeCurrency)
            
            flagClosure2?(money2.imageFlagView)
            
            doubleCurClosureM2?(money2.currencyExchange)
            
            dismiss(animated: true, completion: nil)
        
        } else {
            let alert = UIAlertController(title: "Error", message: "Please, enter the type of currency!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        money1 = Currency()
        money2 = Currency()
        
    }
}
