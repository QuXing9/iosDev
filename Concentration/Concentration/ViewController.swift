//
//  ViewController.swift
//  concentration
//
//  Created by win9斩八哥 on 2022/4/14.
//  Copyright © 2022 win9斩八哥. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Contentration(numberOfPairsOfCard: (cardButtons.count + 2) / 3)
    //翻转次数，didset用于当变量值更改时同步更改控件的值
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    //当控件位于数组内时，进行翻转；否则，抛出错误
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    //更新图片的展示
    func updateViewFromModel() {
        for index in cardButtons.indices {
            //定位按钮和卡片
            let button = cardButtons[index]
            let card = game.cards[index]
            //判断卡片是否已经翻转，如果面朝上，应该设置表情；如果面朝下，表情为空
            if card.isFacedUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChioces = ["👻", "🎃", "👑", "🦇", "🌈", "🍭", "🎱", "🎁"]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChioces.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChioces.count)))
            emoji[card.identifier] = emojiChioces.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
} 
 
