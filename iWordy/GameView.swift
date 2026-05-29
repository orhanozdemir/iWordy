//
//  GameView.swift
//  iWordy
//
//  Created by Orhan Özdemir on 29.05.2026.
//

import SwiftUI

struct GameView: View {
    
    @State var chosenLength: Int = Game.defaultWordLength
    @State var game: Game = Game()
    
    private var statusText: String {
        "Guesses: \(game.attempts.count)"
    }
    
    var body: some View {
        VStack {
            Text("iWordy")
                .font(.system(.largeTitle, weight: .bold))
            HStack {
                headerActionView
            }
            CodeView(code: game.masterCode, selection: $game.selection)
            if !game.isOver {
                CodeView(code: game.guess, selection: $game.selection)
            }
            ScrollView {
                ForEach(Array(game.attempts.reversed().enumerated()), id: \.offset) { index, attempt in
                    CodeView(code: attempt, selection: $game.selection)
                }
            }
            if game.isOver {
                gameOverBanner
            }

            KeyboardView(matchedLetters: game.matchedLetters, canSubmit: game.isValidGuess, canDelete: game.isValidLetter) { letter in
                game.setGuessLetter(letter, at: game.selection)
                if game.selection < game.masterCode.word.count - 1 {
                    game.selection += 1
                }
            } onSubmit: {
                game.makeAttempt()
                game.selection = 0
            } onDelete: {
                game.deleteLetter()
            }

        }
        .onChange(of: chosenLength, { _, newValue in
            game.newGame(wordLength: newValue)
        })
        .padding()
    }
    
    private var headerActionView: some View {
        HStack {
            Picker("Length", selection: $chosenLength) {
                ForEach(Array(Game.minWordLength...Game.maxWordLength), id: \.self) { length in
                    Text("\(length)")
                }
            }
            .pickerStyle(.segmented)
            .fixedSize()
            
            Spacer()
            
            Text(statusText)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .contentTransition(.numericText())
            
            Spacer()
            
            Button {
                startNewGame()
            } label: {
                HStack {
                    Image(systemName: "arrow.clockwise")
                    Text("New Game")
                }
            }
        }
    }
    
    private var gameOverBanner: some View {
        Text("🎉 You Win! - \(game.attempts.count) Guesses")
            .font(.largeTitle.weight(.bold))
            .minimumScaleFactor(0.5)
            .foregroundStyle(.blue)
            .padding()
            .lineLimit(1)
    }
    
    private func startNewGame() {
        game.newGame(wordLength: chosenLength)
    }
}

#Preview {
    GameView()
}
