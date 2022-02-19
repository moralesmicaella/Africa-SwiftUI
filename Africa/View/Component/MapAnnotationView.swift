//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Micaella Morales on 2/18/22.
//

import SwiftUI

struct MapAnnotationView: View {
  // MARK: - PROPERTIES
  @State private var animation: Double = 0.0
  
  let location: NationalParkLocation
  
  // MARK: - BODY
  var body: some View {
    ZStack {
      Circle()
        .fill(Color.accentColor)
        .frame(width: 54, height: 54, alignment: .center)
      
      Circle()
        .stroke(Color.accentColor, lineWidth: 2)
        .frame(width: 52, height: 52, alignment: .center)
        .opacity(1 - (animation * 2))
        .scaleEffect(1 + CGFloat(animation))
        .animation(.easeOut(duration: 2).repeatForever(autoreverses: false), value: animation)
      
      Image(location.image)
        .resizable()
        .scaledToFit()
        .frame(width: 48, height: 48, alignment: .center)
        .clipShape(Circle())
    }
    .onAppear {
      animation = 0.5
    }
  }
}

// MARK: - PREVIEW
struct MapAnnotationView_Previews: PreviewProvider {
  static let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
  
  static var previews: some View {
    MapAnnotationView(location: locations[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
