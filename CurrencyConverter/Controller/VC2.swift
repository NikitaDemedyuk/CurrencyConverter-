//
//  VC2.swift
//  CurrencyConverter
//
//  Created by Никита on 9.02.22.
//

import UIKit

class VC2: UIViewController {

    var money: Currency!
        
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onBYNTapped(_ sender: Any) {
        selectTypeCurrency(typeCurrencyMoney: "BYN")
    }
    
    @IBAction func onRUSTapped(_ sender: Any) {
        selectTypeCurrency(typeCurrencyMoney: "RUS")
    }
    
    @IBAction func onUSDTapped(_ sender: Any) {
        selectTypeCurrency(typeCurrencyMoney: "USD")
    }
    
    @IBAction func onEURTapped(_ sender: Any) {
        selectTypeCurrency(typeCurrencyMoney: "EUR")
    }
    
    @IBOutlet weak var selectBtn: UIButton!
    
    
    @IBAction func selectBtnPressed(_ sender: Any) {
        if money.typeCurrency != nil {
            dismiss(animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "Please, enter the type of currency!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    func selectTypeCurrency(typeCurrencyMoney: String) {
        money.typeCurrency = typeCurrencyMoney
        selectBtn.isEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        money = Currency()
        
    }
}
