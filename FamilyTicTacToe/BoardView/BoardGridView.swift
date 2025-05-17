//
//  BoardGridView.swift
//  FamilyTicTacToe
//
//  Created by Lamar Williams III on 5/17/25.
//

import SwiftUI

struct BoardGridView: View {
  let model: BoardViewModel
  let data: [[BoardViewModel.BoardData]]

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
                let _ = print("Update row=0 col=\(col)")
                MarkView(symbolColor: data[0][col].color, symbolName: data[0][col].symbolName)
                  .onTapGesture {
                    model.onTapGester(row: 0, col: col)
                  }
              }
            }
            .background(Color.white)
            .frame(width: width, height: height)

            GridRow {
              ForEach((0...2), id: \.self) { col in
                let _ = print("Update row=1 col=\(col)")
                MarkView(symbolColor: data[1][col].color, symbolName: data[1][col].symbolName)
                  .onTapGesture {
                    model.onTapGester(row: 1, col: col)
                  }
              }
            }
            .background(Color.white)
            .frame(width: width, height: height)

            GridRow {
              ForEach((0...2), id: \.self) { col in
                let _ = print("Update row=2 col=\(col)")
                MarkView(symbolColor: data[2][col].color, symbolName: data[2][col].symbolName)
                  .onTapGesture {
                    model.onTapGester(row: 2, col: col)
                  }
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
  BoardGridView(model: BoardViewModel(), data: BoardSource.initialData)
}
