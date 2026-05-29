//
//  GameView.swift
//  iWordy
//
//  Created by Orhan Özdemir on 29.05.2026.
//

import SwiftUI

struct GameView: View {
    
    @State var wordLength: Int = 5
    @State var selection: Int = 0
    @State var game: Game = Game()
    
    var body: some View {
        VStack {
            Text("iWordy")
                .font(.system(.largeTitle, weight: .bold))
            HStack {
                headerActionView
            }
            CodeView(code: game.masterCode, selection: $selection)
            if !game.isOver {
                CodeView(code: game.guess, selection: $selection)
            }
            ScrollView {
                ForEach(Array(game.attempts.reversed().enumerated()), id: \.offset) { index, attempt in
                    CodeView(code: attempt, selection: $selection)
                }
            }
            if game.isOver {
                gameOverBanner
            }

            KeyboardView(matchedLetters: game.matchedLetters) { letter in
                game.setGuessLetter(letter, at: selection)
                if selection < game.masterCode.word.count - 1 {
                    selection += 1
                }
            } onSubmit: {
                game.makeAttempt()
                selection = 0
            } onDelete: {
                
            }

        }
        .onChange(of: wordLength, { _, newValue in
            game.newGame()
        })
        .padding()
    }
    
    private var headerActionView: some View {
        HStack {
            Picker("Length", selection: $wordLength) {
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
