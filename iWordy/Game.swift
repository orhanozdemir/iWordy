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
    
    private(set) var wordLength: Int
    
    var isOver: Bool {
        return attempts.last?.word == masterCode.word
    }

    var isValidLetter: Bool {
        guess.letters[selection] != ""
    }
    
    var masterCode: Code
    var guess: Code
    var attempts: [Code] = []
    
    var matchedLetters: [Letter : Code.Match] = [:]
    
    var selection: Int = 0
    
    init(wordLength: Int = Game.defaultWordLength, masterWord: String = "BRAIN") {
        self.wordLength = wordLength
        self.masterCode = Code(kind: .master(isHidden: true), length: wordLength)
        self.guess = Code(kind: .guess, length: wordLength)
    }
    
    
    mutating func setGuessLetter(_ letter: Letter, at index: Int) {
        guess.letters[index] = letter
    }
    
    mutating func makeAttempt() {
        if isOver {
            return
        }
        var attempt = guess
        
        let matches = guess.match(against: masterCode)
        setMatchedLetters(for: attempt, with: matches)
        
        attempt.kind = .attempt(matches: matches)
        attempts.append(attempt)
        
        guess = Code(kind: .guess, length: wordLength)
        
        if isOver {
            masterCode.kind = .master(isHidden: false)
        }
    }
    
    mutating func deleteLetter() {
        if isOver {
            return
        }
        setGuessLetter("", at: selection)
        if selection > 0 {
            selection -= 1
        }
    }
    
    mutating func newGame(wordLength: Int, masterWord: String?) {
        self.wordLength = wordLength
        masterCode = Code(kind: .master(isHidden: true), length: wordLength)
        masterCode.word = masterWord ?? "BRAIN"
        guess = Code(kind: .guess, length: wordLength)
        attempts = []
        selection = 0
        matchedLetters = [:]
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
    
//    private func randomWord(ofLength length: Int) -> String {
//        var word = ""
//        let availableLetters = "QWERTYUIOPASDFGHJKLZXCVBNM"
//        for _ in 1...length {
//            if let letter = availableLetters.randomElement() {
//                word.append(letter)
//            }
//            
//        }
//        return word
//    }
    
}
