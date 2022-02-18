//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Micaella Morales on 2/18/22.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer? {
  if let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
    videoPlayer = AVPlayer(url: url)
    videoPlayer?.play()
  }
  
  return videoPlayer
}
