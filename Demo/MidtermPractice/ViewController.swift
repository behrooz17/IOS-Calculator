//
//  ViewController.swift
//  Midterm - IOS - Swift
//
//  Created by Behrooz Amuyan on 3/23/16.
//  Copyright © 2016 Behrooz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
// definition of the operation tags
//    let TAG_ADDITION       = 100
//    let TAG_SUBTRACTION    = 200
//    let TAG_MULTIPLICATION = 300
//    let TAG_DIVISION       = 400
//    let TAG_PERCENTAGE     = 500
//    let TAG_EQUAL          = 600
//    let TAG_sign           = 700
    
    
    let calculator = Calculator()
    
    @IBOutlet weak var txtResult: UITextField!
    @IBOutlet var numbersButton: [UIButton]!
    @IBOutlet weak var ACbutton: UIButton!
    // MARK: - Buttons
    //When the numeric buttons are pressed
    @IBAction func numbersDidPress(sender: UIButton) {
        
        // when a number is pressed the getDisplayNumber() gets called and returns the result for display.
        txtResult.text = calculator.removeDecimalIfInt(calculator.getDisplayNumber(sender.tag))
        
    }
    
    // Operator that take two oprands (+,-,*,/)
    // When pressed takes the operator and saves it in opration property of calculator.
    @IBAction func operatorDidPress(sender: UIButton) {
        //turning off "AC" and enabling "C" to clear the last number
        calculator.allClear = false
        // changing the lable to "C"
        ACbutton.setTitle("C", forState: UIControlState.Normal)
        
        
        calculator.firstNumber.append(Double(txtResult.text!)!)
        
        calculator.operation.append(String(sender.tag))
        calculator.result = calculator.math()
        txtResult.text = calculator.removeDecimalIfInt(calculator.result)
        calculator.result = 0
        
        //reset decimal point functinality
        calculator.decPressed = false
        
    }
    
    // When (+/-) or (%) are pressed it calls percentage() and returns the result according to the opration.
   @IBAction func btnPercentage(sender: UIButton) {
    
        calculator.singleOperation = String(sender.tag)
        calculator.secondNumber = Double(txtResult.text!)!
        calculator.result = calculator.percentage(calculator.secondNumber!)
        txtResult.text = String(calculator.result)
    
   }

    // Decimal point pressed
    @IBAction func btnDec(sender: UIButton) {
        
        calculator.decPressed = true
        calculator.decDigArray.removeAll()
        
   }
    
    // to reset the calculator. AC/C button.
    @IBAction func btnClear(sender: UIButton) {
        calculator.clear()
        txtResult.text! = "0"
        ACbutton.setTitle("AC", forState: UIControlState.Normal)
        
    }
    
    
    // MARK: - Views
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtResult.text! = "0"
        for var number in numbersButton {
            
            
           
            
            number.layer.borderColor = UIColor(red: 16/255.0, green: 23/255.0, blue: 77/255.0, alpha: 1.0).CGColor
            number.layer.cornerRadius = 10
        }
    
        
    }


}

