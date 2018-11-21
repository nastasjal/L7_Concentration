//
//  ViewController.swift
//  L1_Concentration
//
//  Created by Анастасия Латыш on 21/11/2018.
//  Copyright © 2018 Анастасия Латыш. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "flip count: \(flipCount)"
        }
    }
    @IBOutlet weak var flipCountLabel: UILabel!
    var choiceEmoji: [String] = ["👁", "🗝", "🧸", "🧸", "👁", "🗝"]
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
        flipCard(withEmoji: choiceEmoji[cardNumber], on: sender)
            flipCount += 1
        }
    }
    
    func flipCard (withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
    }
    
}

