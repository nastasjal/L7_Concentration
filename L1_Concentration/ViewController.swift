//
//  ViewController.swift
//  L1_Concentration
//
//  Created by Анастасия Латыш on 21/11/2018.
//  Copyright © 2018 Анастасия Латыш. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

var numberOfPairsOfCards: Int {
        get {
            return (cardButtons.count+1)/2
        }
    }
    
   private lazy var game = Concentration(numberOfCardPars: numberOfPairsOfCards)
    
   private var flipCount = 0 {
        didSet {
            flipCountLabel.text = "flip count: \(flipCount)"
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    var choiceEmoji: [String] = ["👁", "🗝", "🧸", "🧸", "👁", "🗝"]
    
    @IBOutlet private var cardButtons: [UIButton]!
    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            flipCount += 1
        }
    }
    
    private func updateViewFromModel(){
        for index in cardButtons.indices {
           let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 0) : #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            }
        }
    }
    private var emoji=[Card:String]()
    
    private var emojiChoices = ["👁", "🗝", "🧸", "🧲", "🧩", "🚗", "🥎"]
    
    private func emoji (for card: Card) -> String {
        if emoji[card] == nil , emojiChoices.count > 0 {
            emoji[card] = emojiChoices.remove(at: Int(arc4random_uniform(UInt32(emojiChoices.count))))
        }
        return emoji[card] ?? "?"
    }
    
}

