//
//  BoardSource.swift
//  FamilyTicTacToe
//
//  Created by Lamar Williams III on 5/15/25.
//

import Foundation
import SwiftUI

actor BoardSource {
  enum State: Sendable {
    case idle([[BoardData]])
    case player1([[BoardData]])
    case player2([[BoardData]])
    case end([[BoardData]])
  }

  struct BoardData: Sendable {
    let symbolName: String
    let color: Color
  }

  private var state: State
  let stream: AsyncStream<State>
  private let continuation: AsyncStream<State>.Continuation
  private var boardData: [[BoardData]]

  init() {
    boardData = testData
    (stream, continuation) = AsyncStream.makeStream(of: State.self)
    state = .idle(boardData)
  }

  func initialize() {
    continuation.yield(state)
  }
}

let testData = [
  [
    BoardSource.BoardData(symbolName: "xmark", color: .blue),
    BoardSource.BoardData(symbolName: "xmark", color: .blue),
    BoardSource.BoardData(symbolName: "xmark", color: .blue)
  ],
  [
    BoardSource.BoardData(symbolName: "circlebadge", color: .red),
    BoardSource.BoardData(symbolName: "circlebadge", color: .green),
    BoardSource.BoardData(symbolName: "circlebadge", color: .blue)
  ],
  [
    BoardSource.BoardData(symbolName: "xmark", color: .blue),
    BoardSource.BoardData(symbolName: "xmark", color: .blue),
    BoardSource.BoardData(symbolName: "xmark", color: .blue)
  ],
]
