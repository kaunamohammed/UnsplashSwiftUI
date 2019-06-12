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
        VStack(alignment: .leading) {
          Text("Trending Users")
            .font(.headline)
            .bold()
          ScrollView(showsHorizontalIndicator: false) {
            VStack(alignment: .leading) {
              HStack {
                ForEach(self.userListViewModel.users) { user in
                  VStack {
                    UserImageView(router: Router(), producer: UnsplashImage(url: user.regularImageURL))
                    Text(user.firstname)
                      .font(.subheadline)
                      .bold()
                  }
                }
              }
            }
            }.frame(height: 140).padding(.leading, -20).padding(.trailing, -20)
        }
        
        VStack(alignment: .leading) {
          Text("From the community")
            .font(.headline)
            .bold()
          ForEach(self.photoListViewModel.photos) { photoViewModel in
            PhotoListRow(photoViewModel: photoViewModel)
          }
        }
        }.navigationBarTitle(Text("Good Evening"))
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
