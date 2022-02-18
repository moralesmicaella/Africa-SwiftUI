//
//  ContentView.swift
//  Africa
//
//  Created by Micaella Morales on 2/16/22.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES
  let animals: [Animal] = Bundle.main.decode("animals.json")
  
  // MARK: - BODY
  var body: some View {
    NavigationView {
      List {
        CoverImageView()
          .frame(height: 300)
          .listRowInsets(EdgeInsets())
        
        ForEach(animals) { animal in
          NavigationLink(destination: AnimalDetailView(animal: animal)) {
            AnimalListItemView(animal: animal)
              .listRowBackground(Color.clear)
          }
        }
      }
      .listStyle(.plain)
      .navigationTitle("Africa")
      .navigationBarTitleDisplayMode(.large)
    }
    .navigationViewStyle(.stack)
  }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
