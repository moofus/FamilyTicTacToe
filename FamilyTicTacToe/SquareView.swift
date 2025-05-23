//
//  SquareView.swift
//  FamilyTicTacToe
//
//  Created by Lamar Williams III on 4/29/25.
//

import SwiftUI

struct SquareView: View {
  let symbolColor: Color
  let symbolName: String

  var body: some View {
    Image(systemName: symbolName)
      .resizable()
      .foregroundStyle(symbolColor)
      .padding()
  }
}

#Preview {
  SquareView(symbolColor: .red, symbolName: "xmark")
  SquareView(symbolColor: .blue, symbolName: "circlebadge")
}
