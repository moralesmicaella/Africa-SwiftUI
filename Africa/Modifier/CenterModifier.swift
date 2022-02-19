//
//  CenterModifier.swift
//  Africa
//
//  Created by Micaella Morales on 2/18/22.
//

import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}

