//
//  InsetMapView.swift
//  Africa
//
//  Created by Micaella Morales on 2/17/22.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
  // MARK: - PROPERTIES
  @State private var region: MKCoordinateRegion = {
    var mapCoordinate = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
    var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
    var mapRegion = MKCoordinateRegion(center: mapCoordinate, span: mapZoomLevel)
    
    return mapRegion
  }()
  
  // MARK: - BODY
  var body: some View {
    Map(coordinateRegion: $region)
      .overlay(
        NavigationLink(destination: MapView()) {
          HStack {
            Image(systemName: "mappin.circle")
              .foregroundColor(.white)
              .imageScale(.large)
            
            Text("Locations")
              .foregroundColor(.accentColor)
              .fontWeight(.bold)
          }
          .padding(.vertical, 10)
          .padding(.horizontal, 14)
          .background(
            Color.black
              .opacity(0.4)
              .cornerRadius(8)
          )
        }
          .padding(12)
          .buttonStyle(.plain)
        , alignment: .topTrailing
      )
      .frame(height: 256)
      .cornerRadius(12)
  }
}

// MARK: - PREVIEW
struct InsetMapView_Previews: PreviewProvider {
  static var previews: some View {
    InsetMapView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
