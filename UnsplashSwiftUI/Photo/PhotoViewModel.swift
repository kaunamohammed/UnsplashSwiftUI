//
//  PhotoViewModel.swift
//  ExperimentProject
//
//  Created by Kauna Mohammed on 12/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import SwiftUI

public class PhotoViewModel: Identifiable {
  
  @State var isHearted: Bool = false
    
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
    return photo.user?.profileImage?.medium
  }
  
  var relativeDate: String {
    return formatter.localizedString(for: photo.createdAt, relativeTo: Date())
  }
  
  private let photo: Photo
  private let formatter: RelativeDateTimeFormatter

  init(photo: Photo, formatter: RelativeDateTimeFormatter) {
    self.photo = photo
    self.formatter = formatter
  }
  
}
