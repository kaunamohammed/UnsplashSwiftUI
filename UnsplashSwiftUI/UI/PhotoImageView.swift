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
  
  @ObjectBinding var imageLoader: ImageLoader
  
  init(producer: URLProducer) {
    imageLoader = ImageLoader(producer: producer)
  }
  
  var body: some View {
    Image(uiImage: imageLoader.image)
      .resizable()
      .cornerRadius(5)
      .frame(height: 300)
  }
}

struct ProfileImageView : View {
  
  @ObjectBinding var imageLoader: ImageLoader
  
  init(producer: URLProducer) {
    imageLoader = ImageLoader(producer: producer)
  }
  
  var body: some View {
    Image(uiImage: imageLoader.image)
      .resizable()
      .foregroundColor(.gray)
      .clipShape(Circle())
      .overlay(Circle().stroke(Color.black, lineWidth: 2))
      .frame(width: 40, height: 40)
  }
}


struct UserImageView : View {

  @ObjectBinding var imageLoader: ImageLoader
  
  init(producer: URLProducer) {
    imageLoader = ImageLoader(producer: producer)
  }
  
  var body: some View {
    Image(uiImage: imageLoader.image)
      .resizable()
      .foregroundColor(.gray)
      .clipShape(Circle())
      .frame(width: 100, height: 100)
  }
}

struct DependencyContainer {
  
  static let networkRouter = Router()
  
}
