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
      
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onBYNTapped(_ sender: Any) {
        if segueIdentifier == "selCur1" {
            money1.typeCurrency = "BYN"
        }
        
        if segueIdentifier == "selCur2" {
            money2.typeCurrency = "BYN"
        }
    }
    
    @IBAction func onRUSTapped(_ sender: Any) {
        if segueIdentifier == "selCur1" {
            money1.typeCurrency = "RUS"
        }
        
        if segueIdentifier == "selCur2" {
            money2.typeCurrency = "RUS"
        }
    }
    
    @IBAction func onUSDTapped(_ sender: Any) {
        if segueIdentifier == "selCur1" {
            money1.typeCurrency = "USD"
        }
        
        if segueIdentifier == "selCur2" {
            money2.typeCurrency = "USD"
        }
    }
    
    @IBAction func onEURTapped(_ sender: Any) {
        if segueIdentifier == "selCur1" {
            money1.typeCurrency = "EUR"
        }
        
        if segueIdentifier == "selCur2" {
            money2.typeCurrency = "EUR"
        }
    }
    
    @IBOutlet weak var selectBtn: UIButton!
    
    
    typealias Closure = (String) -> ()
    
    var dataClosure: Closure?
    var dataClosure2: Closure?
    
    
    @IBAction func selectBtnPressed(_ sender: Any) {
        if money1.typeCurrency != nil {
           
            dataClosure?(money1.typeCurrency)
        
            dismiss(animated: true, completion: nil)
        
        }
        
        if money2.typeCurrency != nil {
           
            dataClosure2?(money2.typeCurrency)
          
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
