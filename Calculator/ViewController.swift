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

    
    // MARK:- CALC divButtonTapped
    @IBAction func divButtonTapped(_ sender: UIButton) {
        calc.operation = 1
        calc.setOperand(text)
        text = ""
    }
    // MARK:- CALC multButtonTapped
    @IBAction func multButtonTapped(_ sender: UIButton) {
        calc.operation = 2
        calc.setOperand(text)
        text = ""
    }
    // MARK:- CALC subButtonTapped
    @IBAction func subButtonTapped(_ sender: UIButton) {
        calc.operation = 3
        calc.setOperand(text)
        text = ""
    }
    // MARK:- CALC addButtonTapped
    @IBAction func addButtonTapped(_ sender: UIButton) {
        calc.operation = 4
        calc.setOperand(text)
        text = ""
    }
   // MARK:- CALC equalButtonTapped
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        calc.setOperand(text)
        if let result = calc.calculate() {
            text = String(result)
        } else {
            text = "Error"
        }
        lastResult = text
    }
    // MARK:- CALC numberButtonTapped
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        if calc.isFinished {
            text = ""
            calc.isFinished = false
        }
        if sender.currentTitle == "." {
            if text.firstIndex(of: ".") != nil {
                // DECIMAL POINT FOUND ALREADY. IGNORE ADDING IT.
            } else {
                text.append(sender.currentTitle!)
            }
        } else {
            text.append(sender.currentTitle!)
        }
        
    }
    // MARK:- CALC clearButtonTapped
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        if !text.isEmpty {
            text.removeLast()
        }
    }
    // MARK:- CALC negativeButtonTapped
    @IBAction func negativeButtonTapped(_ sender: UIButton) {
        if !text.isEmpty {
            if text.first == "-" {
                text.removeFirst()
            } else {
                text.insert("-", at: text.startIndex)
            }
        }
    }
    // MARK:- CALC memoryPlusButtonTapped
    @IBAction func memoryPlusButtonTapped(_ sender: UIButton) {
        if text.isEmpty {
            text = lastResult
        }
        addButtonTapped(sender)
    }
}

