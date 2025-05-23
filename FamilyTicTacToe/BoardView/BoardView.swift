//
//  BoardView.swift
//  FamilyTicTacToe
//
//  Created by Lamar Williams III on 4/28/25.
//

import SwiftUI
import os

let logger = Logger(
  subsystem: "com.moofus.tictactoe",
  category: "Root View"
)

struct BoardView: View {
  var model = BoardViewModel()

  var body: some View {
    VStack {
      switch model.state {
      case .starting:
        ProgressView()
          .task {
            await model.initialize()
          }
      case .idle(let data):
        HStack {
          Spacer()
          Text("Player: 1")
          Spacer()
          Text("Player: 2")
          Spacer()
        }
        .padding([.leading, .trailing], 32)
        
        BoardGridView(model: model, data: data)
      }
    }
  }
}

#Preview {
  BoardView()
}
