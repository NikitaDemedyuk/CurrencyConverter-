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
    
    var flag1: Bool!
    
    var flag2: Bool!
    
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
        calculate()
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
    
    
    func calculate() {
        if typeCur1.text == "EUR" {
            switch typeCur2.text {
            case "USD":
                let numField1 = Double(txtField1.text!)!
                var numField2: Double? = (numField1 * 2.0)
                txtField2.text = String(numField2!)
            case "RUS":
                let numField1 = Double(txtField1.text!)
                txtField2.text = String(numField1! * 6)
            case "BYN":
                let numField1 = Double(txtField1.text!)
                txtField2.text = String(numField1! * 8)
            default:
                txtField2.text = txtField1.text
            }
        }
        
        if typeCur2.text == "EUR" {
            switch typeCur1.text {
            case "USD":
                let numField1 = Double(txtField2.text!)!
                var numField2: Double? = (numField1 * 2.0)
                txtField1.text = String(numField2!)
            case "RUS":
                let numField1 = Double(txtField2.text!)
                txtField1.text = String(numField1! * 6.0)
            case "BYN":
                let numField1 = Double(txtField2.text!)
                txtField1.text = String(numField1! * 8.0)
            default:
                print(txtField1)
            }
        }
        
        if typeCur1.text == "USD" {
            switch typeCur2.text {
            case "EUR":
                let numField1 = Double(txtField1.text!)!
                var numField2: Double? = (numField1 * 0.5)
                txtField2.text = String(numField2!)
            case "RUS":
                let numField1 = Double(txtField1.text!)
                txtField2.text = String(numField1! * 3.0)
            case "BYN":
                let numField1 = Double(txtField1.text!)
                txtField2.text = String(numField1! * 4.0)
            default:
                txtField2.text = txtField1.text
            }
        }
        
        if typeCur2.text == "USD" {
            switch typeCur1.text {
            case "EUR":
                let numField1 = Double(txtField2.text!)!
                var numField2: Double? = (numField1 * 0.5)
                txtField1.text = String(numField2!)
            case "RUS":
                let numField1 = Double(txtField2.text!)
                txtField1.text = String(numField1! * 3.0)
            case "BYN":
                let numField1 = Double(txtField2.text!)
                txtField1.text = String(numField1! * 4.0)
            default:
                print(txtField1)
            }
        }
        
        
        
    }

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtField1.keyboardType = .decimalPad
        txtField2.keyboardType = .decimalPad
    
        
        
    }
}

