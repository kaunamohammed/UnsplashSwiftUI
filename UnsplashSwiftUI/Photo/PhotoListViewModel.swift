//
//  PhotoListViewModel.swift
//  UnsplashSwiftUI
//
//  Created by Kauna Mohammed on 12/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import Combine
import SwiftUI

public class PhotoListViewModel: BindableObject {
  
  public let didChange = PassthroughSubject<PhotoListViewModel, Never>()
  
  var photos = [PhotoViewModel]() {
    didSet {
      didChange.send(self)
    }
  }
  private let formatter = RelativeDateTimeFormatter()
  private let router: NetworkRouter
  init(router: NetworkRouter) {
    self.router = router
    getPhotos()
  }
  
  private func getPhotos() {
    
    router.request(UnsplashPhotosEndPoint.getPhotos(page: 1,
                                                    numberPerPage: 50,
                                                    orderedBy: .latest),
                   completion: { result in
                    
                    switch result {
                      
                    case .success(let data):
                      
                      do {
                        
                        let photos: [Photo] = try data.decoded()
                        let sortedByDate = photos.sorted { $0.createdAt > $1.createdAt }
                        self.photos = sortedByDate.map { PhotoViewModel(photo: $0, formatter: self.formatter) }
                      } catch let error {
                        print("error: \(error)")
                      }
                      
                    case .failure(let error):
                      
                      print("error: \(error)")
                      
                      
                    }
                    
    })
    
  }
  
}
