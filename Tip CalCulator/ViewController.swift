//
//  ViewController.swift
//  Tip CalCulator
//
//  Created by Ruben Pla on 18/1/16.
//  Copyright © 2016 Ruben Pla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxPctSlider : UISlider!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var resultsTextView : UITextView!
    
    let tipCalc = TipCalCulatorModel(total: 33.25, taxPct: 0.06)
    
    func refreshUI() {
        totalTextField.text = String(format : "%0.2f", tipCalc.total)
        taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
        taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value))%)"
        resultsTextView.text = ""
    }
    
    @IBAction func calculateTapped(sender : AnyObject) {
        tipCalc.total = Double((totalTextField.text! as NSString).doubleValue)
        
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""
        
        for (tipPct, tipValue) in possibleTips {
            results += "\(tipPct)%: \(tipValue)\n"
        }
        
        resultsTextView.text = results
    }
    
    @IBAction func taxPercentageChanged(sender : AnyObject) {
        tipCalc.taxPct = Double(taxPctSlider.value)/100.0
        refreshUI()
    }
    
    @IBAction func viewTapped(sender: AnyObject) {
        totalTextField.resignFirstResponder() //effect of dismissing keyboard
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //This method is called with the root view of this view controller
        //is first accessed.
        
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        //This method is called when the device is running low on memory. 
        //It's a good place to clean up any resources you can spare
    }
}

