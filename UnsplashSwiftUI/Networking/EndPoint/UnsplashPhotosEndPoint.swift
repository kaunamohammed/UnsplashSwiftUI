//
//  UnsplashPhotosEndPoint.swift
//  ExpensifyCodingTest
//
//  Created by Kauna Mohammed on 05/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import Foundation

public struct UnsplashPhotosEndPoint: RESTComponent {

  public let path: String = "/photos"
  private let queryItems: [URLQueryItem]
  
}

extension UnsplashPhotosEndPoint: URLProducer {
  public var url: URL? {
    var components = URLComponents()
    components.scheme = scheme
    components.host = host
    components.path = path
    components.queryItems = queryItems
    return components.url
  }
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
        URLQueryItem(name: "client_id", value: "8e41deb3157736312ddd28a9f78230139e95e616523493a04d67f1390730f74f"),
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
