//
//  ViewController.swift
//  Calculator
//
//  Created by Riad Mohamed on 10/29/19.
//  Copyright © 2019 Riad Mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK:- UI OUTLETS
    @IBOutlet var calculatorKeypadButtons: [UIButton]!
    @IBOutlet weak var screenLabel: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    
    // MARK:- Calculator Properties
    var text: String = "" {
        didSet {
            screenLabel.text = text
            if text.isEmpty {
                clearButton.setTitle("AC", for: .normal)
            } else {
                clearButton.setTitle("C", for: .normal)
            }
        }
    }
    let calc = Calculator()
    var lastResult: String = "0"
    
    // MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        screenLabel.text = ""
        clearButton.setTitle("AC", for: .normal)
        //roundTheCorners()
    }
    
    // MARK:- UI SETUP FUNCTIONS
    func roundTheCorners() {
        for button in calculatorKeypadButtons {
            if button.currentTitle == "0" {
                button.layer.cornerRadius = 50
                button.clipsToBounds = true

            } else {
                button.layer.cornerRadius = 0.5 * button.bounds.size.width
                button.clipsToBounds = true
            }
        }
    }

    
    // MARK:- Calculator IB Functions
    @IBAction func divButtonTapped(_ sender: UIButton) {
        calc.operation = 1
        calc.setOperand(text)
        text = ""
    }
    @IBAction func multButtonTapped(_ sender: UIButton) {
        calc.operation = 2
        calc.setOperand(text)
        text = ""
    }
    @IBAction func subButtonTapped(_ sender: UIButton) {
        calc.operation = 3
        calc.setOperand(text)
        text = ""
    }
    @IBAction func addButtonTapped(_ sender: UIButton) {
        calc.operation = 4
        calc.setOperand(text)
        text = ""
    }
   
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        calc.setOperand(text)
        text = String(calc.calculate())
        lastResult = text
    }
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        if calc.isFinished {
            text = ""
        }
        text.append(sender.currentTitle!)
    }    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        if !text.isEmpty {
            text.removeLast()
        }
    }
    @IBAction func negativeButtonTapped(_ sender: UIButton) {
        if !text.isEmpty {
            if text.first == "-" {
                text.removeFirst()
            } else {
                text.insert("-", at: text.startIndex)
            }
        }
    }
    @IBAction func memoryPlusButtonTapped(_ sender: UIButton) {
        if text.isEmpty {
            // set the operation code to 4
            text = lastResult
            // set the operand to text
        }
        // set the text to the operand
        addButtonTapped(sender)
    }
}

