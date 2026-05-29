//
//  CodeView.swift
//  iWordy
//
//  Created by Orhan Özdemir on 29.05.2026.
//

import SwiftUI

struct CodeView: View {
    
    var code: Code
    @Binding var selection: Int
    
    var body: some View {
        HStack {
            ForEach(code.letters.enumerated(), id: \.offset) { index, letter in
                let isSelected = index == selection
                switch code.kind {
                case .master(let isHidden):
                    LetterView(letter: letter, isHidden: isHidden)
                case .guess:
                    LetterView(letter: letter, isSelected: isSelected)
                        .onTapGesture {
                            selection = index
                        }
                case .attempt:
                    LetterView(letter: letter)
                }
            }
        }
    }
}

#Preview {
    CodeView(code: Code(kind: .master(isHidden: false), length: 5), selection: Binding<Int>(get: { 0 }, set: { _ in }))
}
