//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Никита on 9.02.22.
//

import UIKit

class VC1: UIViewController, UITextFieldDelegate {
    
    var money1: Currency!
    
    var money2: Currency!
    
    @IBOutlet weak var headLbl: UILabel!
   
    @IBOutlet weak var flagImg1: UIImageView!
    
    @IBOutlet weak var typeCur1: UILabel!
    
    @IBAction func selectCur1BtnAct(_ sender: Any) {
      
    }
    
    @IBOutlet weak var txtField1: UITextField!
    
    @IBOutlet weak var flagImg2: UIImageView!
    
    @IBOutlet weak var typeCur2: UILabel!
    
    @IBOutlet weak var txtField2: UITextField!
    
    
    @IBAction func selectCur2BtnAct(_ sender: Any) {
    
    }
    
    
    @IBAction func onConvertTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func onClearTapped(_ sender: UIButton) {
        
        txtField1.text = ""
        txtField2.text = ""
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as? UITouch {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc2 = segue.destination as? VC2 {
            vc2.dataClosure = { [weak self] text in
                self?.typeCur1.text = text
            }
            
            vc2.dataClosure2 = { [weak self] text in
                self?.typeCur2.text = text
            }
            
            vc2.segueIdentifier = segue.identifier
            
        }
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
        txtField1.keyboardType = .decimalPad
        txtField2.keyboardType = .decimalPad
    
    }
}

