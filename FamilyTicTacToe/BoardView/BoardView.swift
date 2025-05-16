//
//  BoardView.swift
//  FamilyTicTacToe
//
//  Created by Lamar Williams III on 4/28/25.
//

import SwiftUI
import os

let logger = Logger(
  subsystem: "com.moofus.tictactoe",
  category: "Root View"
)

struct BoardView: View {
  var model = BoardViewModel()
  
  var body: some View {
    GeometryReader { geometry in
      let width = heightOrWidth(geometry: geometry)
      let height = width
      VStack {
        Spacer()
        HStack {
          Spacer()
          Grid(horizontalSpacing: 12, verticalSpacing: 12) {
            GridRow {
              ForEach((0...2), id: \.self) { col in
                MarkView(symbolColor: model.data[0][col].color, symbolName: model.data[0][col].symbolName)
              }
            }
            .background(Color.white)
            .frame(width: width, height: height)

            GridRow {
              ForEach((0...2), id: \.self) { col in
                MarkView(symbolColor: model.data[1][col].color, symbolName: model.data[1][col].symbolName)
              }
            }
            .background(Color.white)
            .frame(width: width, height: height)

            GridRow {
              ForEach((0...2), id: \.self) { col in
                MarkView(symbolColor: model.data[2][col].color, symbolName: model.data[2][col].symbolName)
              }
            }
            .background(Color.white)
            .frame(width: width, height: height)
          }
          .background(Color.black)
          Spacer()
        }
        Spacer()
      }
    }
  }
  
  private func heightOrWidth(geometry: GeometryProxy) -> CGFloat {
    if geometry.size.width < geometry.size.height {
      return geometry.size.width / 3.0 * 0.8
    }
    return geometry.size.height / 3.0 * 0.8
  }
}

#Preview {
  BoardView()
}
