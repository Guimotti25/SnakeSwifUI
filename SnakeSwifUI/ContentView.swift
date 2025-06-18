import SwiftUI

struct ContentView: View {
    @StateObject private var game = SnakeGame()

    var body: some View {
        VStack {
            Spacer()

            GridView(snake: game.snake, food: game.food)

            Spacer()

            ZStack {
                // ✅ Sua imagem de controle
                Image(uiImage: UIImage(named: "joystick")!)
                    .resizable()
                    .frame(width: 260, height: 220)
                    .aspectRatio(contentMode: .fit)

                // ✅ Área de clique - cima
                Button(action: { game.changeDirection(.up) }) {
                    Color.clear
                        .contentShape(Rectangle())
                }
                .frame(width: 60, height: 60)
                .position(x: 100, y: 30) // Ajuste fino aqui

                // ✅ Área de clique - baixo
                Button(action: { game.changeDirection(.down) }) {
                    Color.clear
                        .contentShape(Rectangle())
                }
                .frame(width: 60, height: 60)
                .position(x: 100, y: 170)

                // ✅ Área de clique - esquerda
                Button(action: { game.changeDirection(.left) }) {
                    Color.clear
                        .contentShape(Rectangle())
                }
                .frame(width: 60, height: 60)
                .position(x: 30, y: 100)

                // ✅ Área de clique - direita
                Button(action: { game.changeDirection(.right) }) {
                    Color.clear
                        .contentShape(Rectangle())
                }
                .frame(width: 60, height: 60)
                .position(x: 170, y: 100)
            }
            .frame(width: 200, height: 200)
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
