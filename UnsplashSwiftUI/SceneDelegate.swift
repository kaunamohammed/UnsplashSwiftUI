//
//  SceneDelegate.swift
//  UnsplashSwiftUI
//
//  Created by Kauna Mohammed on 12/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

    let window = UIWindow(frame: UIScreen.main.bounds)
    let router =  Router()
    window.rootViewController = UIHostingController(rootView: HomeView(photoListViewModel: PhotoListViewModel(router: router)))

    self.window = window
    window.makeKeyAndVisible()
  }

}

