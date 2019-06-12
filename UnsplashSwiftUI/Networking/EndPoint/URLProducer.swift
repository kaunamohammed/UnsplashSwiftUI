//
//  URLProducer.swift
//  ExpensifyCodingTest
//
//  Created by Kauna Mohammed on 05/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import Foundation

public protocol URLProducer {
  var url: URL? { get }
}

public protocol QueryItem {
  var queryItems: [URLQueryItem] { get }
}
