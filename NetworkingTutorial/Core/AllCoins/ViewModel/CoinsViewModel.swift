//
//  CoinsViewModel.swift
//  NetworkingTutorial
//
//  Created by Quest76 on 17.04.2024.
//

import Foundation

class CoinsViewModel: ObservableObject {
  @Published var coin = ""
  @Published var price = ""
  @Published var errorMessage: String?

  private let service = CoinDataService()

  init() {
    fetchPrice(coin: "ethereum")
  }

  func fetchPrice(coin: String) {
    service.fetchCoin(coin: coin) { priceFromService in
      DispatchQueue.main.async {
        self.price = "$\(priceFromService)"
        self.coin = coin.capitalized
      }
    }
  }
}
