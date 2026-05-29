//
//  Code.swift
//  iWordy
//
//  Created by Orhan Özdemir on 29.05.2026.
//

import Foundation

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
    
    enum Kind {
        case master(isHidden: Bool)
        case guess
        case attempt
    }
    
    enum Match {
        case exact
        case inexact
        case nomatch
        
        var color: [String:Int] {
            switch self {
            case .exact: return ["r": 1, "g": 1, "b": 1]
            case .inexact: return ["r": 1, "g": 1, "b": 1]
            case .nomatch: return ["r": 1, "g": 1, "b": 1]
            }
        }
    }
}
