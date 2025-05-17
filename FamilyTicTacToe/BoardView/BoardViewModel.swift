//
//  BoardViewModel.swift
//  FamilyTicTacToe
//
//  Created by Lamar Williams III on 5/15/25.
//

import Foundation
import SwiftUI

@Observable
@MainActor
class BoardViewModel {
  typealias BoardData = BoardSource.BoardData

  @ObservationIgnored
  private let source: BoardSource
  var data: [[BoardData]]

  init() {
    data = BoardSource.initialData
    source = BoardSource()

    Task {
      await processState()
    }
  }

  func initialize() async {
    await source.initialize()
  }

  func onTapGester(row: Int, col: Int) {
    Task.detached { [weak self] in
      guard let self else { return }
      await source.onTapGester(row: row, col: col)
    }
  }
  
  private func processState() async {
    for await state in source.stream {
      print("state=\(state)")
      switch state {
      case .idle(let data):
        self.data = data
      case .player1(let data):
        self.data = data
      case .player2(let data):
        self.data = data
      case .end(let data):
        self.data = data
      }
    }
  }
}
