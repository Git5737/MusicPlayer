//
//  ContentView.swift
//  MusicPlayer
//
//  Created by mac on 30.09.2025.
//

import SwiftUI

struct PlayerView: View {
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            List{
                SongCell()
                    
            }.listStyle(.plain)
        }
    }
}

#Preview {
    PlayerView()
}
