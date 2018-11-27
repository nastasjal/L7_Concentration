//
//  Concentration.swift
//  L1_Concentration
//
//  Created by Анастасия Латыш on 22/11/2018.
//  Copyright © 2018 Анастасия Латыш. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOfoneAndOnlyOneFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    }
                    else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchesIndex = indexOfoneAndOnlyOneFaceUpCard , index != matchesIndex {
                if cards[index].identifier == cards[matchesIndex].identifier {
                    cards[index].isMatched = true
                    cards[matchesIndex].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfoneAndOnlyOneFaceUpCard = index
            }
        } else {

        }
    }
    
    init (numberOfCardPars: Int) {
        for _ in 0..<numberOfCardPars {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    
}
