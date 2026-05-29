//
//  Code.swift
//  iWordy
//
//  Created by Orhan Özdemir on 29.05.2026.
//

import SwiftUI

struct Code {
    
    var kind: Kind
    var letters: [Letter]
    
    init(kind: Kind, length: Int) {
        self.letters = Array(repeating: "", count: length)
        self.kind = kind
    }
    
    var word: String {
        get { letters.joined() }
        set { letters = newValue.uppercased().map { String($0) } }
    }
    
    func match(against masterCode: Code) -> [Match] {
        var lettersToMatch = masterCode.letters
        
        let backwardsExactMatches = letters.indices.reversed().map { index in
            if lettersToMatch.count > index, lettersToMatch[index] == letters[index] {
                lettersToMatch.remove(at: index)
                return Match.exact
            } else {
                return .nomatch
            }
        }
        
        let exactMatches = Array(backwardsExactMatches.reversed())
        
        return letters.indices.map { index in
            if exactMatches[index] != .exact, let matchIndex = lettersToMatch.firstIndex(of: letters[index]) {
                lettersToMatch.remove(at: matchIndex)
                return Match.inexact
            } else {
                return exactMatches[index]
            }
        }
    }
    
    enum Kind {
        case master(isHidden: Bool)
        case guess
        case attempt(matches: [Match])
    }
    
    enum Match {
        case exact
        case inexact
        case nomatch
        
        var color: Color {
            switch self {
            case .exact:   return Color(red: 0.42, green: 0.67, blue: 0.39)
            case .inexact: return Color(red: 0.79, green: 0.66, blue: 0.30)
            case .nomatch: return Color(red: 1.80, green: 0.40, blue: 0.40)
            }
        }
        
        var priority: Int {
            switch self {
            case .exact: return 3
            case .inexact: return 2
            case .nomatch: return 1
            }
        }
    }
}
