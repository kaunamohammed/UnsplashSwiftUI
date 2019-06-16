//
//  HomeView.swift
//  ExperimentProject
//
//  Created by Kauna Mohammed on 12/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import SwiftUI

struct HomeView : View {
  
  @ObjectBinding var photoListViewModel: PhotoListViewModel
  
  var body: some View {
    NavigationView {
      PhotoListView(photoListViewModel: photoListViewModel)
        .navigationBarTitle(Text("Photos"))
    }
  }
}

#if DEBUG
struct HomeView_Previews : PreviewProvider {
  
  static var previews: some View {
    HomeView(
      photoListViewModel: PhotoListViewModel(router: Router())
    )
  }
}
#endif
