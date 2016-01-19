//
//  TipCalculatorModel.swift
//  Tip CalCulator
//
//  Created by Ruben Pla on 19/1/16.
//  Copyright © 2016 Ruben Pla. All rights reserved.
//

import Foundation

class TipCalCulatorModel {
    var total : Double
    var taxPct : Double
    var subTotal : Double {
        get{
            return total / (taxPct + 1)
        }
    }
    
    init(total : Double, taxPct : Double){
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTipPct(tipPct : Double) ->Double {
        return subTotal * tipPct
    }
    
    func returnPossibleTips() -> [Int: Double] {
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        
        var retVal = [Int: Double]()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip * 100)
            retVal[intPct] = calcTipWithTipPct(possibleTip)
        }
        
        return retVal
    }
}
