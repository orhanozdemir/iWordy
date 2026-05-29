//
//  ActionKeyView.swift
//  iWordy
//
//  Created by Orhan Özdemir on 29.05.2026.
//

import SwiftUI

struct ActionKeyView: View {
    
    var imageName: String
    var disabled: Bool
    var title: String?
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Image(systemName: imageName)
                if let title {
                    Text(title)
                }
            }
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(disabled ? Color.gray.opacity(0.25) : Color.gray.opacity(0.5))
            .foregroundStyle(Color.primary)
            .clipShape(RoundedRectangle(cornerRadius: 7))
        }
        .disabled(disabled)
    }
}

#Preview {
    ActionKeyView(imageName: "return", disabled: true) {
        
    }
}
