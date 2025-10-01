//
//  ContentView.swift
//  MusicPlayer
//
//  Created by mac on 30.09.2025.
//

import SwiftUI

struct PlayerView: View {
    
    @StateObject var viewModel = ViewModel()
    @State var showFiles = false
    
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
                        showFiles.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
            .sheet(isPresented: $showFiles) {
                ImportFileServise(songs: $viewModel.songs)
            }
        }
    }
}

#Preview {
    PlayerView()
}
