//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Никита on 9.02.22.
//

import UIKit

class VC1: UIViewController, UITextFieldDelegate {

    var money: Currency!
    
    @IBOutlet weak var headLbl: UILabel!
   
    @IBOutlet weak var flagImg1: UIImageView!
    
    @IBOutlet weak var typeCur1: UILabel!
    
    @IBOutlet weak var txtField1: UITextField!
    
    @IBOutlet weak var flagImg2: UIImageView!
    
    @IBOutlet weak var typeCur2: UILabel!
    
    @IBOutlet weak var txtField2: UITextField!
    
    @IBAction func onConvertTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func onClearTapped(_ sender: UIButton) {
        txtField1.text = ""
        txtField2.text = ""
    
    }
    
    /*@objc func calculate() {
        if let wageTxt = wageTxt.text, let priceTxt = priceTxt.text {
            if let wage = Double(wageTxt), let price = Double(priceTxt) {
                view.endEditing(true)
                resultLbl.isHidden = false
                hoursLbl.isHidden = false
                resultLbl.text = "\(Wage.getHours(forWage: wage, andPrice: price))"
            }
        }
    } */
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

