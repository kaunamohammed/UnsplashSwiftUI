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
      List(self.photoListViewModel.photos) { photoViewModel in
        PhotoListRow(photoViewModel: photoViewModel)
      }
    }
  }
}

#if DEBUG
struct PhotoListView_Previews : PreviewProvider {
  
  static var previews: some View {
    PhotoListView(photoListViewModel: PhotoListViewModel(router: Router()))
  }
}
#endif
