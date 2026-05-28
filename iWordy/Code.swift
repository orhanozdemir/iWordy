//
//  Code.swift
//  iWordy
//
//  Created by Orhan Özdemir on 29.05.2026.
//

import Foundation

struct Code {
    
    var letters: [Letter]
    var kind: Kind
    
    var word: String {
        get { letters.joined() }
        set { letters = newValue.uppercased().map { String($0) } }
    }
    
    enum Kind {
        case master(isHidden: Bool)
        case guess
        case attempt
    }
}
