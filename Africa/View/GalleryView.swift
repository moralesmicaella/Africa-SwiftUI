//
//  GalleryView.swift
//  Africa
//
//  Created by Micaella Morales on 2/16/22.
//

import SwiftUI

struct GalleryView: View {
  // MARK: - PROPERTIES
  @State private var selectedAnimal: String = "lion"
  @State private var gridLayout: [GridItem] = []
  @State private var gridColumns: Double = 3.0
  
  let animals: [Animal] = Bundle.main.decode("animals.json")
  let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
  
  // MARK: - FUNCTIONSS
  func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumns))
  }
  
  // MARK: - BODY
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 30) {
        Image(selectedAnimal)
          .resizable()
          .scaledToFit()
          .clipShape(Circle())
          .overlay {
            Circle()
              .stroke(Color.white, lineWidth: 8)
          }
        
        Slider(value: $gridColumns, in: 2...4, step: 1)
          .padding(.horizontal)
          .onChange(of: gridColumns) { _ in
            gridSwitch()
          }
        
        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
          ForEach(animals) { animal in
            Image(animal.image)
              .resizable()
              .scaledToFit()
              .clipShape(Circle())
              .overlay {
                Circle()
                  .stroke(Color.white, lineWidth: 1)
              }
              .onTapGesture {
                selectedAnimal = animal.image
                hapticImpact.impactOccurred()
              }
          }
        }
        .animation(.easeIn, value: gridColumns)
        .onAppear {
          gridSwitch()
        }
      }
      .padding(.horizontal, 10)
      .padding(.vertical, 50)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(MotionAnimationView())
  }
}

// MARK: - PREVIEW
struct GalleryView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryView()
  }
}
