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
  
  private let random = Bool.random()
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        ProfileImageView(producer: UnsplashImage(url: photoViewModel.profileImageURL))
        Text(photoViewModel.firstname + " " + photoViewModel.lastname)
          .font(.headline)
          .bold()
          .color(.black)
      }
      Spacer()
      PhotoImageView(producer: UnsplashImage(url: photoViewModel.regularImageURL))
      Spacer()
      VStack(alignment: .leading) {
        HStack {
        Image(systemName: random ? "heart.fill" : "heart")
          .resizable()
          .frame(width: 25, height: 25)
          .foregroundColor(random ? .red : .black)
        Text(photoViewModel.totalLikes.stringValue)
          .font(.subheadline)
          .bold()
          .color(random ? .red : .black)
        }
        Text(photoViewModel.relativeDate)
          .font(.footnote)
          .bold()
          .color(.gray)
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
