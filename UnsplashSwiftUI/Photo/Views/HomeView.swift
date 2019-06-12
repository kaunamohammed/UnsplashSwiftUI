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
  
  var strings = ["wow", "hello", "world"]
  
  var body: some View {
    NavigationView {
      List {
        VStack(alignment: .leading) {
          Text("Trending Users")
            .font(.headline)
            .bold()
          ScrollView(showsHorizontalIndicator: false) {
            VStack(alignment: .leading) {
              HStack {
                ForEach(self.userListViewModel.users.identified(by: \.id)) { user in
                  Text(user.firstname)
                }
              }
            }
            }.frame(height: 100)
        }
        
        VStack(alignment: .leading) {
          Text("From the community")
            .font(.headline)
            .bold()
          ForEach(self.photoListViewModel.photos) { photoViewModel in
            PhotoListRow(photoViewModel: photoViewModel)
          }
        }
        }.navigationBarTitle(Text("Latest Photos"))
    }
  }
}

#if DEBUG
struct HomeView_Previews : PreviewProvider {
  static var previews: some View {
    HomeView(photoListViewModel: PhotoListViewModel(router: Router()), userListViewModel: UserListViewModel(router: Router()))
  }
}
#endif
