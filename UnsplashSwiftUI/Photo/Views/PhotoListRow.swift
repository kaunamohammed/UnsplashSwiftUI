//
//  PhotoListRow.swift
//  ExperimentProject
//
//  Created by Kauna Mohammed on 12/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import SwiftUI

struct PhotoListRow : View {
  
  public var photoViewModel: PhotoViewModel
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        ProfileImageView(router: Router(), producer: UnsplashImage(url: photoViewModel.profileImageURL))
        Text(photoViewModel.firstname + " " + photoViewModel.lastname)
          .font(.headline)
          .bold()
          .color(.black)
      }
      Spacer()
      PhotoImageView(router: Router(), producer: UnsplashImage(url: photoViewModel.regularImageURL))
      Spacer()
      HStack {
        Image(systemName: photoViewModel.likedBuUser ? "heart.fill" : "heart")
          .resizable()
          .frame(width: 20, height: 20)
          .foregroundColor(photoViewModel.likedBuUser ? .red : .black)
        Text(photoViewModel.totalLikes.stringValue)
          .font(.footnote)
          .bold()
          .color(photoViewModel.likedBuUser ? .red : .black)
      }
    }
  }
}

struct UnsplashImage: URLProducer {
  
  let url: URL?
  init(url: URL?) {
    self.url = url
  }
  
}

extension Optional where Wrapped == String {
  
  var orEmpty: String {
    switch self {
    case .none: return ""
    case .some(let str): return str
    }
  }
  
}
