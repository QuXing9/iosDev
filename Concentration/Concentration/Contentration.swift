//
//  Contentration.swift
//  concentration
//
//  Created by win9斩八哥 on 2022/4/18.
//  Copyright © 2022 win9斩八哥. All rights reserved.
//

import Foundation

class Contentration {
    
    var cards = [Card]()
    
    var indexOfFaceUpCard = [Int]()
    //如果点击了卡片，应该更新卡片的状态
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            let matchIndex = indexOfFaceUpCard.count > 0 ? indexOfFaceUpCard[0] : -1
            if matchIndex != index{
                if matchIndex >= 0, cards[matchIndex].identifier == cards[index].identifier {
                    if indexOfFaceUpCard.count >= 2 {
                        cards[indexOfFaceUpCard[0]].isMatched = true
                        cards[indexOfFaceUpCard[1]].isMatched = true
                        cards[index].isMatched = true
                        indexOfFaceUpCard = []
                    } else {
                        cards[index].isFacedUp = true
                        indexOfFaceUpCard.append(index)
                    }
                } else {
                    // no cards are faced up
                    for flipDownIndex in cards.indices {
                        cards[flipDownIndex].isFacedUp = false
                    }
                    cards[index].isFacedUp = true
                    indexOfFaceUpCard = []
                    indexOfFaceUpCard.append(index)
                }
            }
        }
    }
    
    init(numberOfPairsOfCard: Int) {
        for _ in 1...numberOfPairsOfCard {
            let card = Card()
            cards += [card, card, card]
        }
        // ToDo: Shuffle the cards
    }
}
