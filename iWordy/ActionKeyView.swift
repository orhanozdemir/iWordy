//
//  ActionKeyView.swift
//  iWordy
//
//  Created by Orhan Özdemir on 29.05.2026.
//

import SwiftUI

struct ActionKeyView: View {
    
    var imageName: String
    var title: String?
    
    var body: some View {
        Button {
            
        } label: {
            HStack {
                Image(systemName: imageName)
                if let title {
                    Text(title)
                }
            }
        }
    }
}

#Preview {
    ActionKeyView(imageName: "return", title: "Enter")
}
