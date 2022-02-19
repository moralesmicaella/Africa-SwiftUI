//
//  LocationModel.swift
//  Africa
//
//  Created by Micaella Morales on 2/18/22.
//

import SwiftUI
import MapKit

struct NationalParkLocation: Identifiable, Codable {
  let id: String
  let name: String
  let image: String
  let latitude: Double
  let longitude: Double
  
  var coordinate: CLLocationCoordinate2D {
    return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}
