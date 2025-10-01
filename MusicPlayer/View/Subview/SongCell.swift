//
//  SongCell.swift
//  MusicPlayer
//
//  Created by mac on 01.10.2025.
//

import SwiftUI

struct SongCell: View {
    
    let song: SongModel
    
    var body: some View {
        HStack {
            Color.pink
                .frame(width: 60, height: 60)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text(song.name)
                    .nameFont()
                Text(song.artist ?? "Unknown Artist")
                    .artistFont()
            }
            
            Spacer()
            
            Text("3:59")
                .artistFont()
        }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
    }
}

#Preview {
    SongCell(song: SongModel(name: "Test", data: Data(), artist: "Test", coverImage: Data(), duration: 1))
}
