//
//  Users.swift
//  UnsplashSwiftUI
//
//  Created by Kauna Mohammed on 12/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import Foundation

// MARK: - SearchResponse
struct SearchResponse: Decodable {
  let total, totalPages: Int
  let results: [User]
  
  enum CodingKeys: String, CodingKey {
    case total
    case totalPages
    case results
  }
}

// MARK: - User
struct User: Decodable {
  let id: String
  let username, name, firstName: String?
  let lastName, instagramUsername, twitterUsername: String?
  let totalLikes, totalPhotos, totalCollections: Int?
  let profileImage: ProfileImage?
  let links: Links?
  
  enum CodingKeys: String, CodingKey {
    case id, username, name
    case firstName
    case lastName
    case instagramUsername
    case twitterUsername
    case totalLikes
    case totalPhotos
    case totalCollections
    case profileImage
    case links
  }
}
