//
//  LetterKeyView.swift
//  iWordy
//
//  Created by Orhan Özdemir on 29.05.2026.
//

import SwiftUI

struct LetterKeyView: View {
    
    var letter: Letter
    
    var match: Code.Match?
    
    var onSelect: (Letter) -> Void
    
    var body: some View {
        Button {
            onSelect(letter)
        } label: {
            Text(letter)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(bgStyle.opacity(0.5))
                .foregroundStyle(Color.primary)
                .clipShape(RoundedRectangle(cornerRadius: 7))
        }
    }
    
    private var bgStyle: Color {
        guard let match else { return .gray }
        return match.color
    }
}

#Preview {
    LetterKeyView(letter: "Q") { letter in
        
    }
}
