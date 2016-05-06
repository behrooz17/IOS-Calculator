//
//
//  Midterm - IOS - Swift
//
//  Created by Behrooz Amuyan on 3/30/16.
//  Copyright © 2016 Behrooz. All rights reserved.
//
// This swift file manages all the logic of the calculator.
// This calculator respects the operation priority.All the operations and numbers are stored in two separate arrays.Each time an operator is pressed it been  compared  with the last operator in the array.

import Foundation

class Calculator {
    //Mark: - Properties
    //propreties
    var firstNumber :[Double]=[]
    var operation : [String] = ["="]
    var singleOperation : String = ""
    // it is used in percentage()
    var secondNumber: Double?
    var decPressed: Bool = false
    var decDigArray:[Double] = []
    //used in getDisplayNumber()
    var result:Double = 0
    var allClear:Bool = true
    var operationPrecedence : [String : Int ] = ["100":10,"200":10,"300":20,"400":20, "600":5]
    //the result of math .
    var resultOfArray: Double = 0
    
    //MARK: - Methods
    // Setting the display number.The function uses the decDigArray for its calculations.
    func getDisplayNumber(var digit:Int )-> Double {
        

        if !decPressed {
            result = result * 10 + Double(digit)
            
            
        }
        // if decimal point is pressed.
        else {
            decDigArray.append(Double(digit))
            
            print ("array is \(decDigArray)")
            result = result + Double(Double(digit) * pow(0.1, Double(decDigArray.count)))
        }
        return result
    }
    // function to remove the ".0" from end of the result .
    func removeDecimalIfInt(var answer:Double)-> String  {
        var forDisplay:String
        
        if answer - floor(answer) == 0 {
            forDisplay =  String(Int(floor(answer)))
        }
        else {
            forDisplay = String(answer)
        }
        return forDisplay
    }
    
    // Calculations
    func math( ) -> Double{
        print("first number is \(firstNumber)")
        // Checks if there is only one element in fisrtNumber , which means either is the first number entered or the calculation is finished by hitting "=".
        if firstNumber.count == 1 {
            return firstNumber[0]
        }
        else {
            // checks the operation precedence to decide which numbers and operation should be performed.
            if operationPrecedence[operation[operation.count-1]] > operationPrecedence[operation[operation.count - 2]] {
                return firstNumber[firstNumber.count - 1]
            }
            else {
                //according to the oparation calculats the result.
                switch operation[operation.count - 2]
                {
                    case "100":
                        resultOfArray = firstNumber[firstNumber.count - 2] + firstNumber[firstNumber.count - 1]
                    case "200":
                    resultOfArray = firstNumber[firstNumber.count - 2] - firstNumber[firstNumber.count - 1]
                    case "300":
                    resultOfArray = firstNumber[firstNumber.count - 2] * firstNumber[firstNumber.count - 1]
                    case "400":
                    resultOfArray = firstNumber[firstNumber.count - 2] / firstNumber[firstNumber.count - 1]
                    default:
                    print("")
                    
                }
                //end of switch
                
                // after calculation, it removes the last 2 elements of the fisrtNumber and replaces it with the resultOfArray.
                firstNumber.removeAtIndex(firstNumber.count - 1)
                firstNumber.removeAtIndex(firstNumber.count - 1)
                print("result is \(resultOfArray)")
                firstNumber.append(resultOfArray)
                print("first number is \(firstNumber)")
                
                //removes the second two last opration
                operation.removeAtIndex(operation.count - 2)
                
                // recursion .math() is being called untill there is only one element in firstNumber[]
                math()
            }
        }
        return firstNumber[0]
        
    }
    // handles the calculation when "%" and "+/-" operations are tapped.
    
    func percentage (var value:Double) -> Double {
        
        
        switch singleOperation {
        case "500" :
            result = value / 100
        case "700" :
            result = value * (-1)
        default :
            print ("")
            
            }
        
        return result
    }
    
    
    // Resets the calculator to 0
    func clear()  {
        
        if allClear == false {
           allClear = true
            result = 0
        }
        else {
            firstNumber.removeAll()
            //secondNumber = nil
            result = 0
            decPressed = false
            
        }
        
        
    }
    
    
}
