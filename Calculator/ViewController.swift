//
//  ViewController.swift
//  Calculator
//
//  Created by Haesong Lee on 1/31/17.
//  Copyright © 2017 Haesong Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var leftHandSide: Double = 0
    var selectedOperator: String = ""
    var computed: Bool = false;
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        let stringNumber = sender.titleLabel!.text!
        
        if displayLabel.text == "0" {
            displayLabel.text = stringNumber
            computed = false
        } else if(displayLabel.text == selectedOperator){
            displayLabel.text = stringNumber
        } else if(!computed){
            displayLabel.text! += stringNumber
        } else {
            displayLabel.text = stringNumber
            computed = false;
        }
    }
    
    @IBAction func operatorButtonPressed(_ sender: UIButton) {
        leftHandSide = Double(displayLabel.text!)!
        selectedOperator = sender.titleLabel!.text!
        displayLabel.text = selectedOperator
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let rightHandSide = Double(displayLabel.text!)!
        var solution: Double = 0
        switch selectedOperator {
        case "÷":
            solution = leftHandSide / rightHandSide
        case "✕":
            solution = leftHandSide * rightHandSide
        case "-":
            solution = leftHandSide - rightHandSide
        case "+":
            solution = leftHandSide + rightHandSide
        default:
            fatalError("Oh boy...")
        }
        displayLabel.text = "\(solution)"
        computed = true;
    }
    
    @IBAction func clearPressed() {
        leftHandSide = 0
        selectedOperator = ""
        displayLabel.text = "0"
        computed = false
    }
    
}
