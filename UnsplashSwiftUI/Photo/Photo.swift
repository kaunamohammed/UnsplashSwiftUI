//
//  Photo.swift
//  UnsplashSwiftUI
//
//  Created by Kauna Mohammed on 12/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import SwiftUI

// MARK: - Photo
struct Photo: Decodable {
  let id: String
  let createdAt, updatedAt: Date
  let width, height: Int
  let color : String?
  let altDescription: String?
  let urls: Urls
  let links: Links?
  let sponsored: Bool
  var sponsoredBy: SponsoredBy?
  let sponsoredImpressionsID: String?
  let likes: Int
  let likedByUser: Bool
  let user: SponsoredBy?
  let sponsorship: Sponsorship?
  
  enum CodingKeys: String, CodingKey {
    case id
    case createdAt
    case updatedAt
    case width, height, color
    case altDescription
    case urls, links, sponsored
    case sponsoredBy
    case sponsoredImpressionsID
    case likes
    case likedByUser
    case user, sponsorship
  }
}

// MARK: - Links
struct Links: Decodable {
  let `self`, html, download, downloadLocation: String?
  
  enum CodingKeys: String, CodingKey {
    case `self`
    case html, download
    case downloadLocation
  }
}

// MARK: - SponsoredBy
struct SponsoredBy: Decodable {
  let id: String?
  let updatedAt: Date?
  let username: String?
  let name: String?
  let firstName: String?
  let lastName: String?
  let twitterUsername: String?
  let portfolioURL: String?
  let bio: String?
  let location: String?
  let links: SponsoredByLinks?
  let profileImage: ProfileImage?
  let instagramUsername: String?
  let totalCollections: Int?
  let totalLikes: Int?
  let totalPhotos: Int?
  let acceptedTos: Bool?
  
  enum CodingKeys: String, CodingKey {
    case id
    case updatedAt
    case username, name
    case firstName
    case lastName
    case twitterUsername
    case portfolioURL
    case bio, location, links
    case profileImage
    case instagramUsername
    case totalCollections
    case totalLikes
    case totalPhotos
    case acceptedTos
  }
}

// MARK: - SponsoredByLinks
struct SponsoredByLinks: Decodable {
  let `self`, html, photos, likes: String?
  let portfolio, following, followers: String?
  
  enum CodingKeys: String, CodingKey {
    case `self`
    case html, photos, likes, portfolio, following, followers
  }
}

// MARK: - ProfileImage
struct ProfileImage: Decodable {
  let small, medium, large: URL?
}

// MARK: - Sponsorship
struct Sponsorship: Decodable {
  let impressionsID, tagline: String?
  let sponsor: SponsoredBy?
  
  enum CodingKeys: String, CodingKey {
    case impressionsID
    case tagline, sponsor
  }
}

// MARK: - Urls
struct Urls: Decodable {
  let raw, full, regular, small: URL
  let thumb: String
}

extension Data {
  
  public func decoded<T: Decodable>(decoder: JSONDecoder = .init()) throws -> T {
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    decoder.dateDecodingStrategy = .iso8601
    return try decoder.decode(T.self, from: self)
  }
  
}
