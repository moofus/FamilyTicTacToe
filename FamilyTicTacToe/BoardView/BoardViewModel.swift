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

  private let source = BoardSource()
  var data: [[BoardData]]

  init() {
    data = testData

    Task {
      await processState()
    }
  }

  private func processState() async {
    for await state in source.stream {
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
