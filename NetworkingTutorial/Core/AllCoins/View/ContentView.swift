
//  ContentView.swift
//  NetworkingTutorial
//
//  Created by Quest76 on 17.04.2024.
//

import SwiftUI

struct ContentView: View {
  @StateObject var viewModel = CoinsViewModel()

  var body: some View {
    List {
      ForEach(viewModel.coins) { coin in
        HStack(spacing: 12) {
          Text("\(coin.marketCapRank)")
            .foregroundStyle(.gray)

          VStack(alignment: .leading, content: {
            Text(coin.name)
              .fontWeight(.semibold)
            Text(coin.symbol.uppercased())

          })
        }
        .font(.footnote)
      }
    }
    .overlay {
      if let error = viewModel.errorMessage {
        Text(error)
      }
    }
  }
}

#Preview {
  ContentView()
}
