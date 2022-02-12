//
//  VC3.swift
//  CurrencyConverter
//
//  Created by Никита on 10.02.22.
//

import UIKit

class VC3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        instructTextView.isEditable = false
    }
    
    @IBOutlet weak var instructLabel: UILabel!
    
    @IBOutlet weak var instructTextView: UITextView!
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
