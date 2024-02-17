//
//  CurrencyAmountView.swift
//  CurrencyConverter
//
//  Created by Jenna Marquardt on 2/13/24.
//

import UIKit

class CurrencyAmountView: UIViewController {

    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet var currencyAmountLabels: [UILabel]!
    @IBOutlet var stackView: [UIStackView]!
    
    var switchArray : Array<Bool> = [true, true, true, true]
    var conversions : Array<Int> = [0, 0, 0, 0]
    var amount : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Update Amount
        amountLabel.text = "$" + String(amount)
        
        // Update and show/hide currency labels
        var i = 0
        for cLabel in currencyAmountLabels {
            //hide label
            stackView[i].isHidden = true
            //if currency switch is on then
            if switchArray[i] {
                stackView[i].isHidden = false
                cLabel.text = "$" + String(conversions[i]) //update number for label
            }
            i += 1
        }
    }
    
    @IBAction func returnToMain(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
