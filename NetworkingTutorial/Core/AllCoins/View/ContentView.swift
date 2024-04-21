
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
        Text(coin.name)
      }
    }
  }
}

#Preview {
  ContentView()
}
