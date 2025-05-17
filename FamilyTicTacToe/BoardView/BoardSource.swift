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
    (stream, continuation) = AsyncStream.makeStream(of: State.self)
    boardData = Self.initialData
    state = .idle(boardData)
    print("\(#function)")
  }

  func initialize() async {
    try? await Task.sleep(nanoseconds: 5000000000)
    continuation.yield(state)
    print("yield")
  }

  func onTapGester(row: Int, col: Int) {
    print("row=\(row) col=\(col)")
    let symbolName = Int.random(in: 0...1) == 0 ? "xmark" : "circlebadge"
    let colorIndex = Int.random(in: 0...2)
    let colors: [Color] = [ .red, .green, .blue]
    let color = colors[colorIndex]
    boardData[row][col] = BoardData(symbolName: symbolName, color: color)
    state = .idle(boardData)
    continuation.yield(state)
  }
}

extension BoardSource {
  static var initialData: [[BoardData]] {
    return [
      [
        BoardSource.BoardData(symbolName: "xmark", color: .blue),
        BoardSource.BoardData(symbolName: "xmark", color: .blue),
        BoardSource.BoardData(symbolName: "xmark", color: .blue)
      ],
      [
        BoardSource.BoardData(symbolName: "circlebadge", color: .blue),
        BoardSource.BoardData(symbolName: "circlebadge", color: .blue),
        BoardSource.BoardData(symbolName: "circlebadge", color: .blue)
      ],
      [
        BoardSource.BoardData(symbolName: "xmark", color: .blue),
        BoardSource.BoardData(symbolName: "xmark", color: .blue),
        BoardSource.BoardData(symbolName: "xmark", color: .blue)
      ]
    ]
  }
}

let testData2 = [
  [
    BoardSource.BoardData(symbolName: "xmark", color: .green),
    BoardSource.BoardData(symbolName: "xmark", color: .green),
    BoardSource.BoardData(symbolName: "xmark", color: .green)
  ],
  [
    BoardSource.BoardData(symbolName: "circlebadge", color: .green),
    BoardSource.BoardData(symbolName: "circlebadge", color: .green),
    BoardSource.BoardData(symbolName: "circlebadge", color: .green)
  ],
  [
    BoardSource.BoardData(symbolName: "xmark", color: .green),
    BoardSource.BoardData(symbolName: "xmark", color: .green),
    BoardSource.BoardData(symbolName: "xmark", color: .green)

  ],
]
