//
//  Player.swift
//  FamilyTicTacToe
//
//  Created by Lamar Williams III on 5/17/25.
//

import Foundation
import SwiftUI

struct Player {
  let id: Int
  private(set) var color: Color
  private(set) var symbol: Symbol
  var symbolName: String {
    "\(symbol)"
  }
}

enum Symbol: CustomStringConvertible {
  case x
  case o

  var description: String {
    switch self {
    case .o: return "circlebadge"
    case .x: return "xmark"
    }
  }
}

