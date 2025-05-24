//
//  GridView.swift
//  SnakeSwifUI
//
//  Created by Guilherme Motti on 20/05/25.
//

import SwiftUICore

struct GridView: View {
    let snake: [CGPoint]
    let food: CGPoint

    var body: some View {
        VStack(spacing: 1) {
            ForEach(0..<20) { y in
                HStack(spacing: 1) {
                    ForEach(0..<20) { x in
                        Rectangle()
                            .foregroundColor(colorAt(x: x, y: y))
                            .frame(width: 15, height: 15)
                    }
                }
            }
        }
    }

    func colorAt(x: Int, y: Int) -> Color {
        let point = CGPoint(x: CGFloat(x), y: CGFloat(y))
        if snake.contains(point) {
            return .green
        } else if food == point {
            return .red
        } else {
            return .gray.opacity(0.2)
        }
    }
}
