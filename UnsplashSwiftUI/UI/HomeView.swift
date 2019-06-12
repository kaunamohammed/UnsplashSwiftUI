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
  @ObjectBinding var userListViewModel: UserListViewModel
  
  var body: some View {
    NavigationView {
      List {
        UserView(userListViewModel: userListViewModel)
        PhotoListView(photoListViewModel: photoListViewModel)
        }.navigationBarTitle(Text("Good Evening"))
    }
  }
}

