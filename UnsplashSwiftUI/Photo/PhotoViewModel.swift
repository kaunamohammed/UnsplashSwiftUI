//
//  PhotoViewModel.swift
//  ExperimentProject
//
//  Created by Kauna Mohammed on 12/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import SwiftUI

public class PhotoViewModel: Identifiable {
    
  public var id: String {
    return photo.id
  }
  
  var firstname: String {
    guard let name = photo.user?.firstName else { return "" }
    return name
  }
  
  var lastname: String {
    guard let name = photo.user?.lastName else { return "" }
    return name
  }
  
  var totalLikes: Int {
    return photo.likes
  }
  
  var likedBuUser: Bool {
    return photo.likedByUser
  }
  
  var regularImageURL: URL {
    return photo.urls.regular
  }
  
  var profileImageURL: URL? {
    return photo.user?.profileImage?.small
  }
  
  private let formatter = RelativeDateTimeFormatter()
  private let times = [1000, 5444, 10, 0, 4999, 2000]
  
  var relativeDate: String {
//    let dateFormatter = DateFormatter()
//    guard let date = dateFormatter.date(from: photo.createdAt) else { return "No date" }
    return formatter.localizedString(for: Date(), relativeTo: Date().addingTimeInterval(TimeInterval(photo.likes)))
  }
  
  private let photo: Photo
  init(photo: Photo) {
    self.photo = photo
  }
  
}
