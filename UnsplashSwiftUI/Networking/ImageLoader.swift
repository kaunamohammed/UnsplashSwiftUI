//
//  ImageLoader.swift
//  UnsplashSwiftUI
//
//  Created by Kauna Mohammed on 13/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import UIKit
import Combine
import SwiftUI
import ImageIO

public class ImageLoader: BindableObject {
  
  public let didChange = PassthroughSubject<ImageLoader, Never>()
  
  var image = UIImage() {
    didSet {
      didChange.send(self)
    }
  }
  
  init(producer: URLProducer) {
    createImage(from: producer.url)
  }
  
  private func createImage(from source: URL?) {
    let options: [CFString: Any] = [
      kCGImageSourceShouldCacheImmediately: true,
    ]
    DispatchQueue.global(qos: .userInteractive).async {
      guard let imageSource = CGImageSourceCreateWithURL(source! as CFURL , nil),
        let image = CGImageSourceCreateImageAtIndex(imageSource, 0, options as CFDictionary) else { return }
      DispatchQueue.main.async {
        self.image = UIImage(cgImage: image)
      }
    }
  }
}
