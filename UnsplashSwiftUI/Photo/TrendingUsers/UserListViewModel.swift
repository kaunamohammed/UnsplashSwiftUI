//
//  UserListViewModel.swift
//  UnsplashSwiftUI
//
//  Created by Kauna Mohammed on 12/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import Combine
import SwiftUI

public class UserListViewModel: BindableObject {
  
  public let didChange = PassthroughSubject<UserListViewModel, Never>()
  
  var users = [UserViewModel]() {
    didSet {
      didChange.send(self)
    }
  }
  
  private let router: NetworkRouter
  init(router: NetworkRouter) {
    self.router = router
    getUsers()
  }
  
  private func getUsers() {
    
    router.request(UsersEndPoint.getUsers(matching: "sophia",
                                          page: 1,
                                          numberPerPage: 10),
                   completion: { result in
                    
                    switch result {
                      
                    case .success(let data):
                      
                      do {
                        
                        let response: SearchResponse = try data.decoded()
                        
                        self.users = response.results.map(UserViewModel.init)
                      } catch let error {
                        print("error: \(error)")
                      }
                      
                    case .failure(let error):
                      
                      print("error: \(error)")
                      
                      
                    }
                    
    })
    
  }
  
}
