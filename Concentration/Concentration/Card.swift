//
//  Card.swift
//  concentration
//
//  Created by win9斩八哥 on 2022/4/18.
//  Copyright © 2022 win9斩八哥. All rights reserved.
//

import Foundation

struct Card {
    
    var isFacedUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
