//
//  Router.swift
//  ExpensifyCodingTest
//
//  Created by Kauna Mohammed on 05/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import Foundation

public final class Router: NetworkRouter {
  
  private var task: URLSessionTask?
  
  public init() {}
  
  public func request(_ route: URLProducer, completion: @escaping NetworkCompletion) {
    let session = URLSession.shared
    guard let request = buildRequest(from: route) else { return }

    task = session.dataTask(with: request, completionHandler: { (data, response, error) in
      
      DispatchQueue.main.async {
        guard error == nil else { completion(.failure(error!)); return }

        if let responseData = data {
          completion(.success(responseData))
        } else {
          //completion(.failure(NetworkError.unknown))
        }
      }
      
    })
    task?.resume()
  }
  
  public func cancel() {
    task?.cancel()
  }
  
  private func buildRequest(from route: URLProducer) -> URLRequest? {
    guard let url = route.url else { return nil }

    var request =  URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 20)
    request.httpMethod = "GET"
    request.addValue("v1", forHTTPHeaderField: "Accept-Version")
    return request
  }
}
