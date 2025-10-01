//
//  ContentView.swift
//  MusicPlayer
//
//  Created by mac on 30.09.2025.
//

import SwiftUI

struct PlayerView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                
                List(viewModel.songs){ song in
                    SongCell(song: song)
                    
                    
                }.listStyle(.plain)
            }
            
            // MARK: - Navigation Bar
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        // action
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    PlayerView()
}
