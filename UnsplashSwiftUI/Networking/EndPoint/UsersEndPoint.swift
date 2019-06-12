//
//  UsersEndPoint.swift
//  UnsplashSwiftUI
//
//  Created by Kauna Mohammed on 12/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import Foundation

public struct UsersEndPoint: RESTComponent {
  
  public let path: String = "/search/users"
  private let queryItems: [URLQueryItem]
  
}

extension UsersEndPoint: URLProducer {
  public var url: URL? {
    var components = URLComponents()
    components.scheme = scheme
    components.host = host
    components.path = path
    components.queryItems = queryItems
    return components.url
  }
}

public extension UsersEndPoint {
  
  static func getUsers(matching query: String,
                       page: Int,
                       numberPerPage: Int) -> UsersEndPoint {
    return UsersEndPoint(
      queryItems: [
        URLQueryItem(name: "client_id", value: "8e41deb3157736312ddd28a9f78230139e95e616523493a04d67f1390730f74f"),
        URLQueryItem(name: "query", value: query),
        URLQueryItem(name: "page", value: page.stringValue),
        URLQueryItem(name: "per_page", value: numberPerPage.stringValue),
      ])
  }
  
}
