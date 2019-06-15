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
  
  @ObjectBinding var imageLoader: ImageLoader = .init()
  
  private let url: URL?
  init(url: URL?) {
    self.url = url
  }
  
  var body: some View {
    Image(uiImage: imageLoader.image)
      .resizable()
      .cornerRadius(5)
      .frame(height: 300)
      .onAppear(perform: { self.imageLoader.createImage(self.url) })
  }
}
