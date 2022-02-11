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
    }
    
    @IBOutlet weak var txtField1: UITextField!
    
    
    @IBOutlet weak var selectCurBtn1: UIButton!
    
    @IBOutlet weak var flagImg2: UIImageView!
    
    @IBOutlet weak var typeCur2: UILabel!
    
    @IBOutlet weak var txtField2: UITextField!
    
    @IBOutlet weak var selectCurBtn2: UIButton!
    
    @IBAction func selectCur2BtnAct(_ sender: Any) {
        selectCurBtn1.setDeselectColorBtnSelect()
        selectCurBtn2.setSelectColorBtnSelect()
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
            
            vc2.segueIdentifier = segue.identifier
        }
    }
    
    func calculate() {
        if !txtField1.text!.isEmpty || !txtField2.text!.isEmpty {
            if typeCur1.text == "EUR" {
                
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
        } else {
            let alert = UIAlertController(title: "Empty fields", message: "Please, enter numbers at least in one field!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        txtField1.keyboardType = .decimalPad
        txtField2.keyboardType = .decimalPad
    
        
        
    }
}

