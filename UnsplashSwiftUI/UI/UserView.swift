//
//  UserView.swift
//  UnsplashSwiftUI
//
//  Created by Kauna Mohammed on 12/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import SwiftUI

struct UserView : View {
  
  @ObjectBinding var userListViewModel: UserListViewModel
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("Trending Users")
        .font(.headline)
        .bold()
      ScrollView(showsHorizontalIndicator: false) {
        VStack(alignment: .leading) {
          HStack {
            ForEach(self.userListViewModel.users) { user in
              VStack {
                UserImageView(url: user.regularImageURL)
                Text(user.firstname)
                  .font(.subheadline)
                  .bold()
                Text(user.instagramName)
                  .font(.footnote)
                  .color(.blue)
              }
            }
          }
        }
        }
        .frame(height: 150)
        .padding(.leading, -20)
        .padding(.trailing, -20)
    }
  }
  
}
