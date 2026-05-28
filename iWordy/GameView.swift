//
//  GameView.swift
//  iWordy
//
//  Created by Orhan Özdemir on 29.05.2026.
//

import SwiftUI

struct GameView: View {
    
    @State var selection: Int = 5
    @State var game: Game = Game()
    
    var body: some View {
        VStack {
            Text("iWordy")
                .font(.system(.largeTitle, weight: .bold))
            HStack {
                headerActionView
            }
            CodeView(code: game.masterCode)
            CodeView(code: game.guess)
            ScrollView {
                ForEach(Array(game.attempts.enumerated()), id: \.offset) { index, attempt in
                    CodeView(code: attempt)
                }
            }
            if game.isOver {
                gameOverBanner
            }

            KeyboardView()
        }
        .padding()
    }
    
    private var headerActionView: some View {
        HStack {
            Picker("Length", selection: $selection) {
                ForEach(Array(Game.minWordLength...Game.maxWordLength), id: \.self) { length in
                    Text("\(length)")
                }
            }
            .pickerStyle(.segmented)
            .fixedSize()
            
            Spacer()
            
            Button {
//                startNewGame()
            } label: {
                HStack {
                    Image(systemName: "arrow.clockwise")
                    Text("Start New Game")
                }
            }
        }
    }
    
    private var gameOverBanner: some View {
        Text("🎉 You win ! \(game.attempts.count) guesses")
    }
}

#Preview {
    GameView()
}
