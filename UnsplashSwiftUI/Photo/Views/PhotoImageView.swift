//
//  PhotoImageView.swift
//  UnsplashSwiftUI
//
//  Created by Kauna Mohammed on 12/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import Combine
import SwiftUI

struct PhotoImageView : View {
  
  @ObjectBinding var photoLoader: PhotoLoader
  
  init(router: NetworkRouter, producer: URLProducer) {
    photoLoader = PhotoLoader(router: router, producer: producer)
  }
  
  var body: some View {
    Image(uiImage: UIImage(data: self.photoLoader.data) ?? .init())
      .resizable()
      .cornerRadius(5)
      .frame(height: 200)
  }
}

struct ProfileImageView : View {
  
  @ObjectBinding var photoLoader: PhotoLoader
  
  init(router: NetworkRouter, producer: URLProducer) {
    photoLoader = PhotoLoader(router: router, producer: producer)
  }
  
  var body: some View {
    Image(uiImage: (photoLoader.data.count == 0) ? UIImage() : UIImage(data: photoLoader.data)! )
      .resizable()
      .foregroundColor(.gray)
      .mask(Circle())
      .frame(width: 40, height: 40)
  }
}
