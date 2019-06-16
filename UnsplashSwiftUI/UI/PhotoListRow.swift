//
//  PhotoListRow.swift
//  ExperimentProject
//
//  Created by Kauna Mohammed on 12/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import SwiftUI

struct PhotoListRow : View {
  
  //@State var isHearted: Bool = false
  
  var isHearted: Bool = Bool.random()
  
  public var photoViewModel: PhotoViewModel
  
  private let random = Bool.random()
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        ProfileImageView(url: photoViewModel.profileImageURL)
        Text(photoViewModel.firstname + " " + photoViewModel.lastname)
          .font(.headline)
          .bold()
          .color(.black)
      }
      Spacer()
      PhotoImageView(url: photoViewModel.regularImageURL)
      Spacer()
      VStack(alignment: .leading) {
        HStack {
          HeartButton(isHearted: isHearted)
          Text(photoViewModel.totalLikes.stringValue)
            .font(.subheadline)
            .bold()
            .color(isHearted ? .red : .black)
        }
        Text(photoViewModel.relativeDate)
          .font(.footnote)
          .bold()
          .color(.gray)
      }
    }
  }
}

#if DEBUG
struct PhotoListRow_Previews : PreviewProvider {
  
  static var previews: some View {
    List(0..<5) { _ in
      PhotoListRow(photoViewModel: PhotoViewModel(photo: photo,
                                                  formatter: .init()))
    }
  }
}
#endif


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

let url = "https://images.unsplash.com/photo-1558981806-ec527fa84c39?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjI2MTM1fQ"
let photo = Photo(id: UUID().uuidString,
                  createdAt: Date(),
                  updatedAt: Date(),
                  width: 0,
                  height: 0,
                  color: nil,
                  altDescription: nil,
                  urls: Urls(raw: URL(string: url)!,
                             full: URL(string: url)!,
                             regular: URL(string: url)!,
                             small: URL(string: url)!,
                             thumb: ""),
                  links: nil,
                  sponsored: false,
                  sponsoredBy: nil, sponsoredImpressionsID: nil,
                  likes: 0,
                  likedByUser: false,
                  user: nil,
                  sponsorship: nil)
