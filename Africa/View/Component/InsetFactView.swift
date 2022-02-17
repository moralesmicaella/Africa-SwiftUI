//
//  InsetFactView.swift
//  Africa
//
//  Created by Micaella Morales on 2/17/22.
//

import SwiftUI

struct InsetFactView: View {
  // MARK: - PROPERTIES
  let animal: Animal
  
  // MARK: - BODY
  var body: some View {
    GroupBox {
      TabView {
        ForEach(animal.fact, id: \.self) { fact in
          Text(fact)
            .padding(.bottom)
        }
      }
      .tabViewStyle(.page)
      .frame(minHeight: 150, idealHeight: 175, maxHeight: 190)
    }
  }
}

// MARK: - PREVIEW
struct InsetFactView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")
  
  static var previews: some View {
    InsetFactView(animal: animals[8])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
