//
//  Concentration.swift
//  L1_Concentration
//
//  Created by Анастасия Латыш on 22/11/2018.
//  Copyright © 2018 Анастасия Латыш. All rights reserved.
//

import Foundation

struct Concentration
{
    var cards = [Card]()
    
    private var indexOfoneAndOnlyOneFaceUpCard: Int? {
        get {
            return cards.indices.filter{cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
 mutating func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchesIndex = indexOfoneAndOnlyOneFaceUpCard , index != matchesIndex {
                if cards[index] == cards[matchesIndex] {
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

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
