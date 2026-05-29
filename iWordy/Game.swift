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
    
    private(set) var chosenLength = defaultWordLength
    
    var masterCode: Code
    var guess: Code
    var attempts: [Code] = []
    
    init() {
        self.masterCode = Code(kind: .master(isHidden: true), length: chosenLength)
        self.masterCode.word = "BRAIN"
        self.guess = Code(kind: .guess, length: chosenLength)
    }
    
    
    mutating func setGuessLetter(_ letter: Letter, at index: Int) {
        guess.letters[index] = letter
    }
    
    mutating func makeAttempt() {
        var attempt = guess
        
        attempt.kind = .attempt
        attempts.append(attempt)
        
        guess = Code(kind: .guess, length: chosenLength)
    }
    
    mutating func newGame() {
        masterCode = Code(kind: .master(isHidden: true), length: chosenLength)
        guess = Code(kind: .guess, length: chosenLength)
        attempts = []
    }
    
}
