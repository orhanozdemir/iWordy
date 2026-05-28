//
//  LetterKeyView.swift
//  iWordy
//
//  Created by Orhan Özdemir on 29.05.2026.
//

import SwiftUI

struct LetterKeyView: View {
    
    var letter: Letter
    
    var body: some View {
        Button {
            
        } label: {
            Text(letter)
        }
    }
}

#Preview {
    LetterKeyView(letter: "Q")
}
