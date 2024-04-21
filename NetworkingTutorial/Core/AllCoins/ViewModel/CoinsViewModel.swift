//
//  CoinsViewModel.swift
//  NetworkingTutorial
//
//  Created by Quest76 on 17.04.2024.
//

import Foundation

class CoinsViewModel: ObservableObject {
  @Published var coins = [Coin]()

  private let service = CoinDataService()

  init() {
    fetchCoins()
  }

  func fetchCoins() {
    service.fetchCoins { coin in
      DispatchQueue.main.sync {
        self.coins = coin
      }
    }
  }
}
