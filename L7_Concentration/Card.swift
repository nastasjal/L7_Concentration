//
//  Card.swift
//  L1_Concentration
//
//  Created by Анастасия Латыш on 22/11/2018.
//  Copyright © 2018 Анастасия Латыш. All rights reserved.
//

import Foundation

struct Card: Hashable {
    var hashValue: Int { return identifier}
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
private static var identifierFactory = 0
    
  private static func getUniqueIdentifier () -> Int {
    Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
