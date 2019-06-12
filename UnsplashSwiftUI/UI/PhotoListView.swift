//
//  PhotoListView.swift
//  UnsplashSwiftUI
//
//  Created by Kauna Mohammed on 12/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import SwiftUI

struct PhotoListView : View {
  
  @ObjectBinding var photoListViewModel: PhotoListViewModel
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("From the community")
        .font(.headline)
        .bold()
      ForEach(self.photoListViewModel.photos) { photoViewModel in
        PhotoListRow(photoViewModel: photoViewModel)
      }
      }.padding(.leading, -10).padding(.trailing, -10)
  }  
}

