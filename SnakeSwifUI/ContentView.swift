//
//  ContentView.swift
//  SnakeSwifUI
//
//  Created by Guilherme Motti on 20/05/25.
//

import SwiftUI

struct ContentView: View
{
    @StateObject private var game = SnakeGame()

    var body: some View {
        VStack {
            Spacer()
            GridView(snake: game.snake, food: game.food)
            Spacer()
            HStack {
                Button("⬅️") { game.changeDirection(.left) }
                Button("⬆️") { game.changeDirection(.up) }
                Button("⬇️") { game.changeDirection(.down) }
                Button("➡️") { game.changeDirection(.right) }
            }
            .font(.largeTitle)
            .padding()
        }
        .onAppear {
            game.start()
        }
        .alert("FIM DE JOGO", isPresented: $game.isGameOver) {
                Button("Reiniciar") {
                    game.restart()
                }
            }
    }
}

#Preview {
    ContentView()
}
