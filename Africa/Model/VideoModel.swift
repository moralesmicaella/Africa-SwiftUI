//
//  VideoModel.swift
//  Africa
//
//  Created by Micaella Morales on 2/18/22.
//

import SwiftUI

struct Video: Identifiable, Codable {
  let id: String
  let name: String
  let headline: String
  
  var thumbnail: String {
    return "video-\(id)"
  }
}
