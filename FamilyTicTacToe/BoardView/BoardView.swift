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
    if let data = model.data {
      BoardGridView(model: model, data: data)
    } else {
      ProgressView()
        .task {
          await model.initialize()
        }
    }
  }
}

#Preview {
  BoardView()
}
