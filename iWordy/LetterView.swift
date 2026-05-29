//
//  LetterView.swift
//  iWordy
//
//  Created by Orhan Özdemir on 29.05.2026.
//

import SwiftUI

typealias Letter = String

struct LetterView: View {
    
    var letter: Letter
    var isHidden: Bool = false
    var isSelected: Bool = false
    var matchColor: Color = .clear
    
    private let letterShape = Circle()
    
    var body: some View {
        ZStack {
            if isHidden {
                letterShape
                    .fill(Color.gray.opacity(0.55))
                    .strokeBorder(Color.gray.opacity(0.55), lineWidth: 3)
            } else {
                letterShape
                    .strokeBorder(Color.gray.opacity(0.55), lineWidth: 3)
                    .fill( isSelected ? Color.blue.opacity(0.25) : matchColor)
                peg
            }
                
        }
        .aspectRatio(1, contentMode: .fit)
    }
    
    private var peg: some View {
        Text(letter)
            .font(.system(size: 200, weight: .bold, design: .rounded))
            .minimumScaleFactor(0.01)
            .lineLimit(1)
            .padding(6)
    }
}

#Preview {
    LetterView(letter: "A", isHidden: false)
}
