//
//  SwiftUIVideoView.swift
//  NetflixClone
//
//  Created by Brian Coleman on 2022-06-11.
//

import SwiftUI
import AVFoundation
import AVKit

struct SwiftUIVideoView: View {
    var url: URL
    
    private var player: AVPlayer {
        AVPlayer(url: url)
    }
    
    var body: some View {
        VideoPlayer(player: player)
    }
}

struct SwiftUIVideoView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIVideoView(url: exampleVideoURL)
    }
}
