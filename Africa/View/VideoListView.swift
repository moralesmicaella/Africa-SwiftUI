//
//  VideoListView.swift
//  Africa
//
//  Created by Micaella Morales on 2/16/22.
//

import SwiftUI

struct VideoListView: View {
  // MARK: - PROPERTIES
  @State var videos: [Video] = Bundle.main.decode("videos.json")
  
  let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
  
  // MARK: - BODY
  var body: some View {
    NavigationView {
      List {
        ForEach(videos) { video in
          VideoListItemView(video: video)
            .padding(.vertical, 8)
        }
      }
      .navigationBarTitle("Videos", displayMode: .inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            videos.shuffle()
            hapticImpact.impactOccurred()
          } label: {
            Image(systemName: "arrow.2.squarepath")
              .foregroundColor(.accentColor)
          }
          .buttonStyle(.plain)
        }
      }
    }
    .navigationViewStyle(.stack)
  }
}

// MARK: - PREVIEW
struct VideoListView_Previews: PreviewProvider {
  static var previews: some View {
    VideoListView()
  }
}
