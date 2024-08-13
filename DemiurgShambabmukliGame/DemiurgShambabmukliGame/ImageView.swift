//
//  ImageView.swift
//  DemiurgShambabmukliGame
//
//  Created by Милана Махсотова on 13.08.2024.
//

import SwiftUI

struct ImageView: View {
    private var backgroundColor: Color
    private var emoji: String
    
    init(backgroundColor: Color, emoji: String) {
        self.backgroundColor = backgroundColor
        self.emoji = emoji
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(backgroundColor)
                .frame(width: 40, height: 40, alignment: .center)
            Text(emoji)
                .font(.system(size: 20, weight: .bold)) // Устанавливаем размер и вес шрифта
                .foregroundColor(.white)
        }
        .padding(5)
    }
}

#Preview {
    ImageView(backgroundColor: .blue, emoji: "💀")
}
