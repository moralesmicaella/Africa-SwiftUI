//
//  CreditsView.swift
//  Africa
//
//  Created by Micaella Morales on 2/18/22.
//

import SwiftUI

struct CreditsView: View {
  var body: some View {
    VStack {
      Image("compass")
        .resizable()
        .scaledToFit()
        .frame(width: 120, height: 120)
      Text("""
      Copyright © Micaella Morales
      All right reserved
      Better Apps ♡ Less Code
      """)
        .font(.footnote)
        .multilineTextAlignment(.center)
    }
    .padding()
    .opacity(0.4)
  }
}

struct CreditsView_Previews: PreviewProvider {
  static var previews: some View {
    CreditsView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
