//
//  SquareData.swift
//  FamilyTicTacToe
//
//  Created by Lamar Williams III on 5/17/25.
//

import SwiftUI

struct SquareData {
  let symbolColor: Color
  let symbolName: String

  init(symbolColor: Color, symbolName: String) {
    self.symbolColor = symbolColor
    self.symbolName = symbolName
  }
}

