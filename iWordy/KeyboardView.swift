//
//  KeyboardView.swift
//  iWordy
//
//  Created by Orhan Özdemir on 29.05.2026.
//

import SwiftUI

struct KeyboardView: View {
    
    let availableLetters: [Letter] = "QWERTYUIOPASDFGHJKLZXCVBNM".map { String($0) }
    let keyboardRowCount = 3
    
    var canSubmit: Bool = false
    var canDelete: Bool = true
    
    var onSelect: (Letter) -> Void
    var onSubmit: () -> Void
    var onDelete: () -> Void
    
    private var rows: [[Letter]] {
        var rowCharCount = availableLetters.count / keyboardRowCount + 2
        
        var rows: [[Letter]] = []
        var row: [Letter] = []
        
        for letter in availableLetters {
            row.append(letter)
            if row.count == rowCharCount {
                rows.append(row)
                row.removeAll()
                rowCharCount -= 1
            }
        }
        
        if !row.isEmpty {
            rows.append(row)
        }
        
        return rows
    }
    
    var body: some View {
        VStack {
            ForEach(Array(rows).enumerated(), id: \.offset) { index, row in
                HStack {
                    if index == keyboardRowCount - 1 {
                        ActionKeyView(imageName: "return", action: onSubmit)
                    }
                    ForEach(row.enumerated(), id: \.offset) { index, letter in
                        LetterKeyView(letter: letter) { letter in
                            onSelect(letter)
                        }
                    }
                    if index == keyboardRowCount - 1 {
                        ActionKeyView(imageName: "delete.left", action: onDelete)
                    }
                }
            }
        }
    }
}

#Preview {
    KeyboardView { letter in
        
    } onSubmit: {
        
    } onDelete: {
        
    }

}
