//
//  CodeView.swift
//  iWordy
//
//  Created by Orhan Özdemir on 29.05.2026.
//

import SwiftUI

struct CodeView: View {
    
    var code: Code
    
    var body: some View {
        HStack {
            ForEach(code.letters, id: \.self) { letter in
                LetterView(letter: letter)
            }
        }
    }
}

#Preview {
    CodeView(code: Code(letters: ["B","R","A","I","N"], kind: .master(isHidden: false)))
}
