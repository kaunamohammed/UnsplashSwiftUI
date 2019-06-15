//
//  SearchResponse.swift
//  UnsplashSwiftUI
//
//  Created by Kauna Mohammed on 12/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import Foundation

// MARK: - SearchResponse
struct SearchResponse<T: Decodable>: Decodable {
  let total, totalPages: Int
  let results: [T]
  
  enum CodingKeys: String, CodingKey {
    case total
    case totalPages
    case results
  }
}

struct GlobalConstants {
  
  struct Unsplash {
    static let apiKey = "Your API Key"
  }
  
}
