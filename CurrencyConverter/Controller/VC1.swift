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
        selectCurBtn1.setSelectColorBtnSelect()
        selectCurBtn2.setDeselectColorBtnSelect()
        
        money1.boolFlag = true
        money2.boolFlag = false
        
        txtField1.isEnabled = true
        txtField2.isEnabled = false
        
    }
    
    @IBOutlet weak var txtField1: UITextField!
    
    
    @IBOutlet weak var selectCurBtn1: UIButton!
    
    @IBOutlet weak var flagImg2: UIImageView!
    
    @IBOutlet weak var typeCur2: UILabel!
    
    @IBOutlet weak var txtField2: UITextField!
    
    @IBOutlet weak var selectCurBtn2: UIButton!
    
    @IBOutlet weak var convertBtn: UIButton!
    
    @IBOutlet weak var clearBtn: UIButton!
    
    @IBAction func selectCur2BtnAct(_ sender: Any) {
        selectCurBtn1.setDeselectColorBtnSelect()
        selectCurBtn2.setSelectColorBtnSelect()
        
        money1.boolFlag = false
        money2.boolFlag = true
        
        txtField1.isEnabled = false
        txtField2.isEnabled = true
    }
    
    @IBAction func onConvertTapped(_ sender: UIButton) {
    
        calculate()
        
    }
    
    @IBAction func onClearTapped(_ sender: UIButton) {
        
        txtField1.text = ""
        txtField2.text = ""
    
    }
    
    @objc func editingBegan(_ textField: UITextField) {}
    
    
    @objc func editingChanged(_ textField: UITextField) {
        //текст изменился
    }

    @objc func editingEnded(_ textField: UITextField) {
      
    }
    
    func checkString(string: String) -> Bool {
        let set = CharacterSet(charactersIn: string)
        //if CharacterSet.decimalDigits.isSuperset(of: set) {
            return true
        //} else {
          //  return false
        //}
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
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
                print(text)
                self?.typeCur1.text = text
            }
            
            vc2.flagClosure = { [weak self] text in
                switch text {
                case "BYNFlag":
                    self?.flagImg1.image = UIImage(named: "belFlagImage.jpg")
                case "RUSFlag":
                    self?.flagImg1.image = UIImage(named: "rusFlagImage.jpg")
                case "USDFlag":
                    self?.flagImg1.image = UIImage(named: "usdFlagImage.jpg")
                case "EURFlag":
                    self?.flagImg1.image = UIImage(named: "eurFlagImage.jpg")
                default:
                    print("Error")
                }
            }
            
            vc2.dataClosure2 = { [weak self] text in
                self?.typeCur2.text = text
            }
            
            vc2.flagClosure2 = { [weak self] text in
                switch text {
                case "BYNFlag":
                    self?.flagImg2.image = UIImage(named: "belFlagImage.jpg")
                case "RUSFlag":
                    self?.flagImg2.image = UIImage(named: "rusFlagImage.jpg")
                case "USDFlag":
                    self?.flagImg2.image = UIImage(named: "usdFlagImage.jpg")
                case "EURFlag":
                    self?.flagImg2.image = UIImage(named: "eurFlagImage.jpg")
                default:
                    print("Error")
                }
            }
            
            vc2.doubleCurClosureM1 = { [weak self] double in
                print(double)
                self?.money1.currencyExchange = double
            }
            
            vc2.doubleCurClosureM2 = { [weak self] double in
                print(double)
                self?.money2.currencyExchange = double
            }
            vc2.segueIdentifier = segue.identifier
        }
    }
    
    func calculate() {
        if !txtField1.text!.isEmpty || !txtField2.text!.isEmpty {
            if money1.boolFlag! {
                if checkString(string: txtField1.text!) {
                    let numField1 = Double(txtField1.text!)
                    txtField2.text = String(numField1! / money1.currencyExchange * money2.currencyExchange)
                } else {
                    let alert = UIAlertController(title: "Error", message: "Text field must contain  only numbers!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }

            if money2.boolFlag! {
                if checkString(string: txtField2.text!) {
                    let numField2 = Double(txtField2.text!)
                    txtField1.text = String(numField2! / money2.currencyExchange * money1.currencyExchange)
                } else {
                    let alert = UIAlertController(title: "Error", message: "Text field must contain  only numbers!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        } else {
            let alert = UIAlertController(title: "Empty fields", message: "Please, enter numbers at least in one field!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
          
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        money1 = Currency()
        money2 = Currency()
        
        money1.boolFlag = true
        money2.boolFlag = false
        
        money1.typeCurrency = "EUR"
        money2.typeCurrency = "USD"
        
        money1.currencyExchange = 2.0
        money2.currencyExchange = 2.5
        
        txtField1.keyboardType = .decimalPad
        txtField2.keyboardType = .decimalPad
    }
}










/*

if typeCur1.text == "EUR"
 switch typeCur2.text {
   case "USD":
       let numField1 = Double(txtField1.text!)
       txtField2.text = String(numField1! * 2.0)
   case "RUS":
       let numField1 = Double(txtField1.text!)
       txtField2.text = String(numField1! * 6.0)
   case "BYN":
       let numField1 = Double(txtField1.text!)
       txtField2.text = String(numField1! * 8.0)
   default:
       txtField2.text = txtField1.text
   }
}

if typeCur2.text == "EUR" {
   switch typeCur1.text {
   case "USD":
       let numField1 = Double(txtField2.text!)
       var numField2: Double? = (numField1! * 2.0)
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
       let numField1 = Double(txtField1.text!)
       var numField2: Double? = (numField1! * 0.5)
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
       let numField1 = Double(txtField2.text!)
       var numField2: Double? = (numField1! * 0.5)
       txtField1.text = String(numField2!)
   case "RUS":
       let numField1 = Double(txtField2.text!)
       txtField1.text = String(numField1! * 3.0)
   case "BYN":
       let numField1 = Double(txtField2.text!)
       txtField1.text = String(numField1! * 4.0)
   default:
       txtField1.text = txtField2.text
   }
}
 
 
 */

















// let numField1 = Double(txtField1.text!)
// txtField2.text = String(numField1! * money2.currencyExchange2 * money1.currencyExchange)
