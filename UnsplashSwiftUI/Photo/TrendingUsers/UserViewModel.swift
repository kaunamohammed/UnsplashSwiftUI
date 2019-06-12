//
//  UserViewModel.swift
//  UnsplashSwiftUI
//
//  Created by Kauna Mohammed on 12/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import SwiftUI

public class UserViewModel: Identifiable {
  
  public var id: String {
    return user.id 
  }
  
  var firstname: String {
    return user.firstName.orEmpty
  }
  
  var lastname: String {
    return user.lastName.orEmpty
  }
  
  var regularImageURL: URL? {
    return user.profileImage?.medium
  }
  
  private let user: User
  init(user: User) {
    self.user = user
  }
  
}
