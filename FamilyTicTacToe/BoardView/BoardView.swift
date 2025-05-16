//
//  ContentView.swift
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

struct ContentView: View {
  var body: some View {
    GeometryReader { geometry in
      let width = heightOrWidth(geometry: geometry)
      VStack {
        Spacer()
        HStack {
          Spacer()
          Grid(horizontalSpacing: 12, verticalSpacing: 12) {
            GridRow {
              MarkView(symbolColor: .red, symbolName: "xmark")
              MarkView(symbolColor: .red, symbolName: "circlebadge")
              MarkView(symbolColor: .red, symbolName: "xmark")
            }
            .background(Color.white)
            .frame(width: width, height: width)
            
            GridRow {
              MarkView(symbolColor: .red, symbolName: "circlebadge")
              MarkView(symbolColor: .red, symbolName: "xmark")
              MarkView(symbolColor: .red, symbolName: "circlebadge")
            }
            .background(Color.white)
            .frame(width: width, height: width)
            
            GridRow {
              MarkView(symbolColor: .red, symbolName: "xmark")
              MarkView(symbolColor: .red, symbolName: "circlebadge")
              MarkView(symbolColor: .red, symbolName: "xmark")
            }
            .background(Color.white)
            .frame(width: width, height: width)
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
  ContentView()
}

struct CellView:  View {
  var body: some View {
    Rectangle()
      .clipShape(Capsule())
  }
}
