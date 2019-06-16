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
  
  public let didChange = PassthroughSubject<UIImage, Never>()
    
  var image: UIImage = .init() {
    didSet {
      didChange.send(image)
    }
  }

}

extension ImageLoader {
  
  public func createImage(_ input: URL?) {
    guard let source = input else { return }
    let options: [CFString: Any] = [ kCGImageSourceShouldCacheImmediately: true ]
    guard let imageSource = CGImageSourceCreateWithURL(source as CFURL , nil),
      let cgImage = CGImageSourceCreateImageAtIndex(imageSource, 0, options as CFDictionary) else { return }
    let image = UIImage(cgImage: cgImage)
    self.image = image
    
  }
  
}
