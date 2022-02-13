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
    
    func showAlert(message1: String, message2: String) -> UIAlertController {
        let alert = UIAlertController(title: message1, message: message2, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
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
    
    func calculate() -> Double {
        if !txtField1.text!.isEmpty || !txtField2.text!.isEmpty {
            if money1.boolFlag! {
                let numField1 = Double(txtField1.text!)
                money2.moneySum = numField1! / money1.currencyExchange * money2.currencyExchange
                txtField2.text = String(money2.moneySum)
                return money2.moneySum
            }

            if money2.boolFlag! {
                let numField2 = Double(txtField2.text!)
                money1.moneySum = numField2! / money2.currencyExchange * money1.currencyExchange
                txtField1.text = String(money1.moneySum)
                return money1.moneySum
            }
            
            if !money1.boolFlag && !money2.boolFlag {
                let alert = showAlert(message1: "Select currecny", message2: "Please, select currecny at least in one field!")
                self.present(alert, animated: true, completion: nil)
                return 0.0
            }
        } else {
            let alert = showAlert(message1: "Empty fields" , message2: "Please, enter numbers at least in one field!")
            self.present(alert, animated: true, completion: nil)
            return 0.0
        }
        return 0.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        money1 = Currency(moneySumM: 0.0,typeCurrencyM: "EUR", imageFlagViewM: "eurFlagImage.jpg",currencyExchangeM: 2.0, boolFlagM: false)
        money2 = Currency(moneySumM: 0.0, typeCurrencyM: "USD", imageFlagViewM: "usdFlagImage.jpg", currencyExchangeM: 2.5, boolFlagM: false)
        
        txtField1.keyboardType = .decimalPad
        txtField2.keyboardType = .decimalPad
    }
}









