//
//  RESTComponent.swift
//  ExpensifyCodingTest
//
//  Created by Kauna Mohammed on 05/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

public protocol RESTComponent {
  var scheme: String { get }
  var host: String { get }
  var path: String { get }
}

public extension RESTComponent {
  var scheme: String {
    return "https"
  }
  var host: String {
    return "api.unsplash.com"
  }
}
