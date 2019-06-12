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
  
  init(producer: URLProducer) {
    photoLoader = PhotoLoader(router: DependencyContainer.networkRouter, producer: producer)
  }
  
  var body: some View {
    Image(uiImage: UIImage(data: self.photoLoader.data) ?? .init())
      .resizable()
      .cornerRadius(5)
      .frame(height: 300)
  }
}

struct ProfileImageView : View {
  
  @ObjectBinding var photoLoader: PhotoLoader
  
  init(producer: URLProducer) {
    photoLoader = PhotoLoader(router: DependencyContainer.networkRouter, producer: producer)
  }
  
  var body: some View {
    Image(uiImage: (photoLoader.data.count == 0) ? UIImage() : UIImage(data: photoLoader.data)! )
      .resizable()
      .foregroundColor(.gray)
      .clipShape(Circle())
      .overlay(Circle().stroke(Color.black, lineWidth: 2))
      .frame(width: 40, height: 40)
  }
}


struct UserImageView : View {
  
  @ObjectBinding var photoLoader: PhotoLoader
  
  init(producer: URLProducer) {
    
    photoLoader = PhotoLoader(router: DependencyContainer.networkRouter, producer: producer)
  }
  
  var body: some View {
    Image(uiImage: (photoLoader.data.count == 0) ? UIImage() : UIImage(data: photoLoader.data)! )
      .resizable()
      .foregroundColor(.gray)
      .clipShape(Circle())
      .frame(width: 100, height: 100)
  }
}

struct DependencyContainer {
  
  static let networkRouter = Router()
  
}