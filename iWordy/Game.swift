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
    
    var matchedLetters: [Letter : Code.Match] = [:]
    
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
        
        let matches = guess.match(against: masterCode)
        setMatchedLetters(for: attempt, with: matches)
        
        attempt.kind = .attempt(matches: matches)
        attempts.append(attempt)
        
        guess = Code(kind: .guess, length: chosenLength)
        
        if isOver {
            masterCode.kind = .master(isHidden: false)
        }
    }
    
    mutating func newGame() {
        masterCode = Code(kind: .master(isHidden: true), length: chosenLength)
        guess = Code(kind: .guess, length: chosenLength)
        attempts = []
    }
    
    mutating func setMatchedLetters(for code: Code, with matches: [Code.Match]) {
        for (index, match) in matches.enumerated() {
            let letter = code.letters[index]
            if let existingMatch = matchedLetters[letter] {
                if existingMatch.priority < match.priority {
                    matchedLetters[letter] = match
                }
            } else {
                matchedLetters[letter] = match
            }
        }
    }
    
}
