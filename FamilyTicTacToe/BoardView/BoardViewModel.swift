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
  typealias State = BoardSource.State

  private let source: BoardSource
  var state: State


  init() {
    source = BoardSource()
    state = .starting

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
      self.state = state
      switch state {
      case .starting:
        assertionFailure("This should never happen")
      case .idle(let data):
        self.state = .idle(data)
      }
    }
  }
}
