//
//  ContentView.swift
//  Africa
//
//  Created by Micaella Morales on 2/16/22.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES
  @State private var isGridViewActive: Bool = false
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridIcon: String = "square.grid.2x2"
  
  let animals: [Animal] = Bundle.main.decode("animals.json")
  let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
  
  // MARK: - FUNCTIONSS
  func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
    
    let gridColumns = gridLayout.count
    switch(gridColumns) {
    case 1:
      gridIcon = "square.grid.2x2"
    case 2:
      gridIcon = "square.grid.3x2"
    case 3:
      gridIcon = "rectangle.grid.1x2"
    default:
      gridIcon = "square.grid.2x2"
    }
    
  }
  
  // MARK: - BODY
  var body: some View {
    NavigationView {
      Group {
        if !isGridViewActive {
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
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
              ForEach(animals) { animal in
                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                  AnimalGridItemView(animal: animal)
                }
                .buttonStyle(.plain)
              }
            }
            .padding(10)
            .animation(.easeIn, value: isGridViewActive)
          }
        }
      }
      .navigationTitle("Africa")
      .navigationBarTitleDisplayMode(.large)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          HStack(spacing: 16) {
            Button {
              isGridViewActive = false
              hapticImpact.impactOccurred()
            } label: {
              Image(systemName: "square.fill.text.grid.1x2")
                .font(.title2)
                .foregroundColor(isGridViewActive ? .primary : .accentColor)
            }
            
            Button {
              isGridViewActive = true
              gridSwitch()
              hapticImpact.impactOccurred()
            } label: {
              Image(systemName: gridIcon)
                .font(.title2)
                .foregroundColor(isGridViewActive ? .accentColor : .primary)
            }
          }
          .buttonStyle(.plain)
        }
      }
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
