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

  init() {
    fetchPrice(coin: "ethereum")
  }

  func fetchPrice(coin: String) {
    let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
    guard let url = URL(string: urlString) else { return }

    URLSession.shared.dataTask(with: url) { data, _, _ in
      guard let data = data else { return }
      guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
      guard let value = jsonObject[coin] as? [String: Double] else { return }
      guard let price = value["usd"] else { return }

      self.coin = coin.capitalized
      self.price = "$\(price)"

      // or this code to update in main thread
//      DispatchQueue.main.async {
//        self.coin = "Bitcoin"
//        self.price = "$\(price)"
//      }
    }.resume()
  }
}
