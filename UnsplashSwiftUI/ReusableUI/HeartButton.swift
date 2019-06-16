//
//  HeartButton.swift
//  UnsplashSwiftUI
//
//  Created by Kauna Mohammed on 14/06/2019.
//  Copyright © 2019 Kauna Mohammed. All rights reserved.
//

import SwiftUI
import Combine

struct HeartButton : View {
  
  @State var isHearted: Bool
  
  var body: some View {
    Button(action: { self.isHearted.toggle() }, label: {
      Image(systemName: isHearted ? "heart.fill" : "heart")
        .resizable()
        .foregroundColor( isHearted ? .red : .black)
        .frame(width: 25, height: 25)
    })
  }
  
}

#if DEBUG
struct HeartView_Previews : PreviewProvider {
  
  static var previews: some View {
      HeartButton(isHearted: false)
  }
}
#endif
