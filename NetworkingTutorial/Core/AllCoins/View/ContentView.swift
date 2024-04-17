
//  ContentView.swift
//  NetworkingTutorial
//
//  Created by Quest76 on 17.04.2024.
//

import SwiftUI

struct ContentView: View {
  @StateObject var viewModel = CoinsViewModel()

  var body: some View {
    VStack {
      Text("\(viewModel.coin): \(viewModel.price)")
        .font(.title)
        .padding()
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
