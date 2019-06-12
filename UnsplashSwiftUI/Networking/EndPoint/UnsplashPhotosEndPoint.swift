//
//  UnsplashPhotosEndPoint.swift
//  ExpensifyCodingTest
//
//  Created by Kauna Mohammed on 05/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import Foundation

public struct UnsplashPhotosEndPoint: AllCompasing {

  public let path: String = "/photos"
  public let queryItems: [URLQueryItem]
  
}

public extension UnsplashPhotosEndPoint {
  
  enum OrderType: String {
    case latest
    case oldest
    case popular
  }
  
  static func getPhotos(page: Int,
                        numberPerPage: Int,
                        orderedBy: OrderType) -> UnsplashPhotosEndPoint {
    return UnsplashPhotosEndPoint(
      queryItems: [
        URLQueryItem(name: "client_id", value: "Your Unsplash API Key"),
        URLQueryItem(name: "page", value: page.stringValue),
        URLQueryItem(name: "per_page", value: numberPerPage.stringValue),
        URLQueryItem(name: "order_by", value: orderedBy.rawValue)
      ])
  }
  
}


extension Int {
  
  var stringValue: String {
    return String(self)
  }
  
}
