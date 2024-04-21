//
//  CoinService.swift
//  NetworkingTutorial
//
//  Created by Quest76 on 21.04.2024.
//

import Foundation

class CoinDataService {
  private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false&locale=en"

  func fetchCoins(completion: @escaping ([Coin]) -> Void) {
    guard let url = URL(string: urlString) else { return }

    URLSession.shared.dataTask(with: url) { data, _, _ in
      guard let data = data else { return }

      guard let coins = try? JSONDecoder().decode([Coin].self, from: data) else { return }

      completion(coins)
    }.resume()
  }

  func fetchCoin(coin: String, completion: @escaping (Double) -> Void) {
    let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
    guard let url = URL(string: urlString) else { return }

    URLSession.shared.dataTask(with: url) { data, response, error in
      // Error Handling
      if let error = error {
        print("Debug: Failed with error \(error.localizedDescription)")

        DispatchQueue.main.async {
//          self.errorMessage = error.localizedDescription
        }
        return
      }

      // Handling response
      guard let httpResponse = response as? HTTPURLResponse else {
//        self.errorMessage = "Bad HTTP Response"
        return
      }

      guard httpResponse.statusCode == 200 else {
//        self.errorMessage = "Bad HTTP Response"
        return
      }

      // Code here runs on background Thread
      guard let data = data else { return }
      guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
      guard let value = jsonObject[coin] as? [String: Double] else { return }
      guard let price = value["usd"] else { return }

      // Update UI in main Thread
//      DispatchQueue.main.async {
//        self.coin = coin.capitalized
//        self.price = "$\(price)"
//      }
      completion(price)
    }.resume()
  }
}
