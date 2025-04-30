//
//  MarkView.swift
//  FamilyTicTacToe
//
//  Created by Lamar Williams III on 4/29/25.
//

import SwiftUI

struct MarkView: View {
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
  MarkView(symbolColor: .red, symbolName: "xmark")
  MarkView(symbolColor: .blue, symbolName: "circlebadge")
}
