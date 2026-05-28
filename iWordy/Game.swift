//
//  Game.swift
//  iWordy
//
//  Created by Orhan Özdemir on 29.05.2026.
//

import Foundation

struct Game {
    
    static let minWordLength = 3
    static let maxWordLength = 6
    static let defaultWordLength = 5
    
    var isOver: Bool {
        return attempts.last?.word == masterCode.word
    }
    
    var masterCode: Code = Code.init(letters: ["B", "R", "A", "I", "N"], kind: .master(isHidden: true))
    var guess: Code = Code(letters: Array.init(repeating: "", count: 5), kind: .guess)
    var attempts: [Code] = []
    var chosenLength = defaultWordLength
    
    
    
}
