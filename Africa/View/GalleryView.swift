//
//  GalleryView.swift
//  Africa
//
//  Created by Micaella Morales on 2/16/22.
//

import SwiftUI

struct GalleryView: View {
  // MARK: - PROPERTIES
  
  // MARK: - BODY
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      Text("Gallery")
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(MotionAnimationView())
  }
}

// MARK: - PREVIEW
struct GalleryView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryView()
  }
}
