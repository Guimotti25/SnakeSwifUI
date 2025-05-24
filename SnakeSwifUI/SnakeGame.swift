//
//  SnakeGame.swift
//  SnakeSwifUI
//
//  Created by Guilherme Motti on 20/05/25.
//

import Foundation


class SnakeGame: ObservableObject {
    enum Direction {
        case up, down, left, right
    }
    @Published var isGameOver = false
    @Published var snake: [CGPoint] = [CGPoint(x: 5, y: 5)]
    @Published var food: CGPoint = CGPoint(x: 10, y: 10)

    private var timer: Timer?
    private var direction: Direction = .right
    private let gridSize: CGFloat = 20

    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
            self.moveSnake()
        }
    }

    func changeDirection(_ newDirection: Direction) {
        // Evitar direção oposta
        direction = newDirection
    }

    func moveSnake() {
        guard var head = snake.first else { return }

        switch direction {
        case .up: head.y -= 1
        case .down: head.y += 1
        case .left: head.x -= 1
        case .right: head.x += 1
        }

        snake.insert(head, at: 0)

        if head == food {
            // Gera nova comida
            food = CGPoint(x: CGFloat(Int.random(in: 0..<20)), y: CGFloat(Int.random(in: 0..<20)))
        } else {
            snake.removeLast()
        }

        // Verifica colisões
        if head.x < 0 || head.y < 0 || head.x >= 20 || head.y >= 20 || snake.dropFirst().contains(head) {
            self.timer?.invalidate()
            self.isGameOver = true
        }
    }
    
    func restart() {
        snake = [CGPoint(x: 5, y: 5)]
        food = CGPoint(x: CGFloat(Int.random(in: 0..<20)), y: CGFloat(Int.random(in: 0..<20)))
        direction = .right
        isGameOver = false
        start()
    }

}
