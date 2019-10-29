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
    @IBOutlet var calculatorKeypadButton: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        roundTheCorners()
    }
    
    // MARK:- UI SETUP FUNCTIONS
    func roundTheCorners() {
        for button in calculatorKeypadButton {
            if button.currentTitle == "0" {
                button.layer.cornerRadius = 50
                button.clipsToBounds = true

            } else {
                button.layer.cornerRadius = 0.5 * button.bounds.size.width
                button.clipsToBounds = true
            }
        }
    }


}

