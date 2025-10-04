//
//  SongCell.swift
//  MusicPlayer
//
//  Created by mac on 01.10.2025.
//

import SwiftUI

struct SongCell: View {
    
    let song: SongModel
    let durationFormatter: (TimeInterval) -> String
    
    var body: some View {
        HStack {
            
            SongImageView(imageData: song.coverImage, size: 60)
            
            VStack(alignment: .leading) {
                Text(song.name)
                    .nameFont()
                Text(song.artist ?? "Unknown Artist")
                    .artistFont()
            }
            
            Spacer()
            
            if let duration = song.duration {
                Text("\(durationFormatter(duration))")
                    .artistFont()
            }
            
            
        }
            .listRowBackground(Color.clear)
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
    }
}

#Preview {
    PlayerView()
}
