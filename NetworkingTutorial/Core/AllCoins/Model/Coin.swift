//
//  Coin.swift
//  NetworkingTutorial
//
//  Created by Quest76 on 21.04.2024.
//

import Foundation

struct Coin: Codable, Identifiable {
  let id: String
  let symbol: String
  let name: String
//  let currentPrice: Double
//  let marketCapRank: Int
}
