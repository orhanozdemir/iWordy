//
//  LetterKeyView.swift
//  iWordy
//
//  Created by Orhan Özdemir on 29.05.2026.
//

import SwiftUI

struct LetterKeyView: View {
    
    var letter: Letter
    
    var onSelect: (Letter) -> Void
    
    var body: some View {
        Button {
            onSelect(letter)
        } label: {
            Text(letter)
        }
    }
}

#Preview {
    LetterKeyView(letter: "Q") { letter in
        
    }
}
