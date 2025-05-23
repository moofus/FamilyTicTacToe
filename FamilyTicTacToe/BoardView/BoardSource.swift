//
//  BoardSource.swift
//  FamilyTicTacToe
//
//  Created by Lamar Williams III on 5/15/25.
//

import Foundation
import SwiftUI

actor BoardSource {
  enum State {
    case starting
    case idle([[SquareData]])
  }

//  struct Data {
//    private var boardData: [[SquareData]]
//
//    init() {
//      self.boardData = BoardSource.initialData
//    }
//  }

  let stream: AsyncStream<State>

//  private var data: Data
  private let continuation: AsyncStream<State>.Continuation
  private var boardData: [[SquareData]]

  private(set) var state: State

  init() {
    boardData = Self.initialData
    state = .starting
//    data = Data()
    (stream, continuation) = AsyncStream.makeStream(of: State.self)
  }

  func initialize() async {
    try? await Task.sleep(nanoseconds: 2_000_000_000)
    state = .idle(boardData)
    continuation.yield(state)
  }

  func onTapGester(row: Int, col: Int) {
    print("row=\(row) col=\(col)")
    let symbolName = Int.random(in: 0...1) == 0 ? "xmark" : "circlebadge"
    let colorIndex = Int.random(in: 0...2)
    let colors: [Color] = [ .red, .green, .blue]
    let symbolColor = colors[colorIndex]
    boardData[row][col] = SquareData(symbolColor: symbolColor, symbolName: symbolName)
    state = .idle(boardData)
    continuation.yield(state)
  }
}

extension BoardSource {
  static var initialData: [[SquareData]] {
    return [
      [
        SquareData(symbolColor: .red, symbolName: "xmark"),
        SquareData(symbolColor: .red, symbolName: "xmark"),
        SquareData(symbolColor: .red, symbolName: "xmark")
      ],
      [
        SquareData(symbolColor: .green, symbolName: "circlebadge"),
        SquareData(symbolColor: .green, symbolName: "circlebadge"),
        SquareData(symbolColor: .green, symbolName: "circlebadge")
      ],
      [
        SquareData(symbolColor: .blue, symbolName: "xmark"),
        SquareData(symbolColor: .blue, symbolName: "xmark"),
        SquareData(symbolColor: .blue, symbolName: "xmark")
      ]
    ]
  }
}

//let testData2 = [
//  [
//    SquareData(symbolName: "xmark", color: .green),
//    SquareData(symbolName: "xmark", color: .green),
//    SquareData(symbolName: "xmark", color: .green)
//  ],
//  [
//    SquareData(symbolName: "circlebadge", color: .green),
//    SquareData(symbolName: "circlebadge", color: .green),
//    SquareData(symbolName: "circlebadge", color: .green)
//  ],
//  [
//    SquareData(symbolName: "xmark", color: .green),
//    SquareData(symbolName: "xmark", color: .green),
//    SquareData(symbolName: "xmark", color: .green)
//
//  ],
//]
