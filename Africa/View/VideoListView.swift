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
          NavigationLink(destination: VideoPlayerView(videoSelected: video.id, videoTitle: video.name)) {
            VideoListItemView(video: video)
              .padding(.vertical, 8)
          }
        }
      }
      .navigationTitle("Videos")
      .navigationBarTitleDisplayMode(.inline)
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
  }
}

// MARK: - PREVIEW
struct VideoListView_Previews: PreviewProvider {
  static var previews: some View {
    VideoListView()
  }
}
