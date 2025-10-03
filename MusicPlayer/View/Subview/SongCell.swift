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
            if let data = song.coverImage, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
            } else {
                ZStack {
                    Color.gray
                        .frame(width: 60, height: 60)
                    Image(systemName: "music.note")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 30)
                        .foregroundStyle(.white)
                }
                .cornerRadius(10)
            }
            
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
