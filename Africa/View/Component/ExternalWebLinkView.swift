//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Micaella Morales on 2/17/22.
//

import SwiftUI

struct ExternalWebLinkView: View {
  // MARK: - PROPERTIES
  let animal: Animal
  
  // MARK: - BODY
  var body: some View {
    GroupBox {
      HStack {
        Image(systemName: "globe")
        Text("Wikipedia")
        
        Spacer()
        
        Link(destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!, label: {
          Text(animal.name)
          Image(systemName: "arrow.up.right.square")
        })
        .foregroundColor(.accentColor)
        .buttonStyle(.plain)
      }
    }
  }
}

// MARK: - PREVIEW
struct ExternalWebLinkView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")
  
  static var previews: some View {
    ExternalWebLinkView(animal: animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
