//
//  UserImageView.swift
//  UnsplashSwiftUI
//
//  Created by Kauna Mohammed on 13/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import Combine
import SwiftUI

struct UserImageView : View {
  
  @ObjectBinding var imageLoader: ImageLoader = .init()
  
  private let url: URL?
  init(url: URL?) {
    self.url = url
  }
  
  var body: some View {
    Image(uiImage: imageLoader.image)
      .resizable()
      .foregroundColor(.gray)
      .clipShape(Circle())
      .frame(width: 100, height: 100)
      .onAppear(perform: { self.imageLoader.createImage(self.url) })
  }
}
