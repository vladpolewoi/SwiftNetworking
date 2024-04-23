//
//  CoinsViewModel.swift
//  NetworkingTutorial
//
//  Created by Quest76 on 17.04.2024.
//

import Foundation

class CoinsViewModel: ObservableObject {
  @Published var coins = [Coin]()
  @Published var errorMessage: String?

  private let service = CoinDataService()

  init() {
    print("Init")
    fetchCoins()
  }

  func fetchCoins() {
    service.fetchCoins { coins, error in
      DispatchQueue.main.sync {
        if let error = error {
          self.errorMessage = error.localizedDescription
          return
        }
        
        self.coins = coins ?? []
      }
    }
  }
}
