//
//  Calculator.swift
//  Calculator
//
//  Created by Riad Mohamed on 10/29/19.
//  Copyright © 2019 Riad Mohamed. All rights reserved.
//

import Foundation

class Calculator {
    // MARK:- Properties
    var leftOperand: Double? = nil
    var rightOperand: Double? = nil
    var isFinished: Bool = false
    var operation: Int = 0
    var result: Double? = nil
    
    // MARK:- Methods
    func calculate() -> Double {
        // 1: Division, 2: Multiplication, 3: Subtraction, 4: Addition
        if let leftOP = leftOperand, let rightOP = rightOperand {
            switch operation {
                case 1:
                result = leftOP / rightOP
                case 2:
                result = leftOP * rightOP
                case 3:
                result = leftOP - rightOP
                case 4:
                result = leftOP + rightOP
                default:
                result = leftOP + rightOP
            }
            isFinished = true
            leftOperand = nil
            rightOperand = nil
            return result ?? 6969
        }
        print("ERROR READING OPERANDS!!")
        return 6969
    }
    
    func setOperand(_ text: String) {
        if leftOperand == nil {
            leftOperand = Double(text)
        } else if rightOperand == nil {
            rightOperand = Double(text)
        }
    }
}
