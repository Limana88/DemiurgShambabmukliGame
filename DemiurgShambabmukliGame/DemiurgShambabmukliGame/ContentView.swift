//
//  ContentView.swift
//  DemiurgShambabmukliGame
//
//  Created by Милана Махсотова on 13.08.2024.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State private var cells: [CellState] = []
    
    private let lastCellId = UUID()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollViewReader { proxy in
                    ScrollView(.vertical) {
                        LazyVStack(spacing: 5) {
                            ForEach(0..<cells.count, id: \.self) { index in
                                CellView(state: cells[index])
                                    .id(index)
                            }
                            Text("")
                                .id(lastCellId)
                        } .onChange(of: cells) { _ in
                            withAnimation {
                                proxy.scrollTo(lastCellId, anchor: .bottom)
                            }
                        }
                        
                    }
                }
                
                Button(action: {
                    updateCells()
                }) {
                    Text("Сотворить")
                        .padding()
                        .background(Color.purple.opacity(0.5))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .bold()
                }
            }
            .padding()
            .background(Color.purple.opacity(0.5))
            .navigationTitle("Клеточное наполнение")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.purple.opacity(0.5), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
        .background(Color.purple)
        .edgesIgnoringSafeArea(.all)
    }
    
    private func updateCells() {
        let randomValue = Int.random(in: 0..<2)
        
        let newState: CellState = randomValue == 0 ? .dead : .live
        
        // Добавляем новую клетку
        cells.append(newState)
        
        // Проверяем, нужно ли удалить .newLife или добавить новую
        if cells.count >= 3 {
            let lastThree = cells.suffix(3)
            if lastThree.allSatisfy({ $0 == .dead }) {
                if let index = cells.lastIndex(of: .newLife) {
                    cells.remove(at: index)
                    print("delete newlife")
                }
            } else if lastThree.allSatisfy({ $0 == .live }) {
                cells.append(.newLife)
                print("add newlife")
            }
        }
    }
}


#Preview {
    ContentView()
}
