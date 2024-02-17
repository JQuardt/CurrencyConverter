//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Jenna Marquardt on 2/13/24.
//

import UIKit
//Euro 1 USD to .93
//Pound Sterling 1 USD to .79
//Australian Dollar 1 USD to 1.55
// Canadian Dollar 1 USD to 1.36

class ViewController: UIViewController {
    
    @IBOutlet weak var usdTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    var currencyLogic = CurrencyLogic()

    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
    }
    
    @IBAction func euroSwitch(_ sender: UISwitch) {
        currencyLogic.setEuroSwitch(sender.isOn)
    }
    
    @IBAction func poundSwitch(_ sender: UISwitch) {
        currencyLogic.setPoundSwitch(sender.isOn)
    }
    
    @IBAction func ausDollarSwitch(_ sender: UISwitch) {
        currencyLogic.setAusDollarSwitch(sender.isOn)
    }
    
    @IBAction func canDollarSwitch(_ sender: UISwitch) {
        currencyLogic.setCanDollarSwitch(sender.isOn)
    }
    
    
    @IBAction func convert(_ sender: UIButton) {
        errorLabel.isHidden = true
        //returns tuple of string value and boolean
        let text = currencyLogic.sendValue(usdTextField.text!) // returns tuple of
        if text.isValid {
            //If value is valid, the boolean is true and value is integer.
            usdTextField.text = ""
            self.performSegue(withIdentifier: "toCurrencyAmountView", sender: self)
        } else {
            //If value is invalid, the boolean is false and value is error message.
            errorLabel.isHidden = false
            errorLabel.text = text.result
            usdTextField.text = ""
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toCurrencyAmountView" {
            let navigation = segue.destination as! CurrencyAmountView
            //navigation.amount = amount
            navigation.switchArray = currencyLogic.getSwitchArray()
            navigation.conversions = currencyLogic.getConversions()
            navigation.amount = currencyLogic.getAmount()
        }
    }
}

