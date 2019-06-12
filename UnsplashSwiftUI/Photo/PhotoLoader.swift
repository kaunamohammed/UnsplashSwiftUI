//
//  PhotoLoader.swift
//  UnsplashSwiftUI
//
//  Created by Kauna Mohammed on 12/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import Combine
import SwiftUI

class PhotoLoader: BindableObject {
  
  let didChange = PassthroughSubject<PhotoLoader, Never>()
  
  var data = Data() {
    didSet {
      didChange.send(self)
    }
  }
  
  private let router: NetworkRouter
  private let producer: URLProducer
  init(router: NetworkRouter, producer: URLProducer) {
    self.router = router
    self.producer = producer
    getImages()
  }
  
  func getImages() {
    router.request(producer) { (result) in
      switch result {
      case .success(let d): self.data = d
      case .failure(let e): print(e)
      }
    }
  }
}
