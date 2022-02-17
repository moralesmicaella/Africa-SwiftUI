//
//  CoverImageView.swift
//  Africa
//
//  Created by Micaella Morales on 2/16/22.
//

import SwiftUI

struct CoverImageView: View {
  // MARK: - PROPERTIES
  let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
  
  // MARK: - BODY
  var body: some View {
    TabView {
      ForEach(coverImages) { image in
        Image(image.name)
          .resizable()
          .scaledToFill()
      }
    }
    .tabViewStyle(.page)
  }
}

// MARK: - PREVIEW
struct CoverImageView_Previews: PreviewProvider {
  static var previews: some View {
    CoverImageView()
      .previewLayout(.sizeThatFits)
  }
}
