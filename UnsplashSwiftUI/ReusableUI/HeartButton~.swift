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
  
  @Binding var isHearted: Bool
  
  var body: some View {
    Button(action: { self.isHearted.toggle() }, label: {
      Image(systemName: isHearted ? "heart.fill" : "heart")
        .resizable()
        .foregroundColor( isHearted ? .red : .black)
        .frame(width: 25, height: 25)
    })
  }
  
}

struct HeartView : View {

  @State var isHearted: Bool = false

  var body: some View {

    NewHeartButton(isHearted: $isHearted)

  }
  
}

#if DEBUG
struct HeartView_Previews : PreviewProvider {
  
  static var previews: some View {
    HeartView(isHearted: false)
  }
}
#endif
