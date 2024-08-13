//
//  CellView.swift
//  DemiurgShambabmukliGame
//
//  Created by Милана Махсотова on 13.08.2024.
//

import SwiftUI

enum CellState {
    case live
    case dead
    case newLife
    case death
}

class CellStateInfo {
    static func description(for state: CellState) -> (description: String, subtitle: String) {
        switch state {
        case .live:
            return ("Живая", "и шевелится!")
        case .dead:
            return ("Мертвая", "или прикидывается")
        case .newLife:
            return ("Жизнь", "ку-ку!")
        case .death:
            return ("death", "")
        }
    }
    
    static func emoji(for state: CellState) -> String {
        switch state {
        case .live:
            return "💥"
        case .dead:
            return "💀"
        case .newLife:
            return "🐣"
        case .death:
            return "death"
        }
    }
    
    static func backgroundColor(for state: CellState) -> Color {
        switch state {
        case .live:
            return .yellow
        case .dead:
            return .blue
        case .newLife:
            return .green
        case .death:
            return .clear
        }
    }
}

struct CellView: View {
    
    private var state: CellState
    
    init(state: CellState) {
        self.state = state
    }
    
    var body: some View {
        HStack {
            ImageView(
                backgroundColor: CellStateInfo.backgroundColor(for: state),
                emoji: CellStateInfo.emoji(for: state)
            )
            VStack(alignment: .leading) {
                let info = CellStateInfo.description(for: state)
                Text(info.description)
                    .font(.system(size: 20, weight: .bold))
                Text(info.subtitle)
                    .font(.system(size: 18, weight: .regular))
            }
            .padding(5)
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(10)
//        .padding()
    }
}

#Preview {
    CellView(state: .dead)
}
