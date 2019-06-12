//
//  PhotoListView.swift
//  ExperimentProject
//
//  Created by Kauna Mohammed on 12/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import SwiftUI

struct PhotoListView : View {
  
  @ObjectBinding var photoListViewModel: PhotoListViewModel
  
  var body: some View {
    NavigationView {
      List(photoListViewModel.photos) { photoViewModel in
        PhotoListRow(photoViewModel: photoViewModel)
      }.navigationBarTitle(Text("Latest Photos"))
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
