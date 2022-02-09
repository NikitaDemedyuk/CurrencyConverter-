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
    }
    
    @IBAction func onRUSTapped(_ sender: Any) {
    }
    
    @IBAction func onUSDTapped(_ sender: Any) {
    }
    
    @IBAction func onEURTapped(_ sender: Any) {
    }
    
    @IBOutlet weak var selectBtn: UIButton!
    func selectTypeCurrency(typeCurrencyMoney: String) {
        money.typeCurrency = typeCurrencyMoney
        selectBtn.isEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
