//
//  ContentView.swift
//  MusicPlayer
//
//  Created by mac on 30.09.2025.
//

import SwiftUI

struct PlayerView: View {
    
    @StateObject var viewModel = ViewModel()
    @State private var showFiles = false
    @State private var showFullPlayer = false
    @Namespace private var playerAnimation
    
    var frameImage: CGFloat {
        showFullPlayer ? 350 : 50
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                BackgroundView()
                
                VStack {
                    // MARK: - List Of Song
                    List(viewModel.songs){ song in
                        ForEach(viewModel.songs) { song in
                            SongCell(song: song, durationFormatter: viewModel.durationFormatted)
                                .onTapGesture {
                                    viewModel.playAudio(song: song)
                                }
                        }.onDelete(perform: viewModel.delete)
                    }
                    .listStyle(.plain)
                    
                    Spacer()
                    
                    // MARK: - Player
                    if viewModel.currentSong != nil {
                        
                        Player()
                        .frame(height: showFullPlayer ? UIScreen.main.bounds.height + SizeConstant.fullPlayer : SizeConstant.miniPlayer)
                        .onTapGesture {
                            withAnimation(.spring) {
                                self.showFullPlayer.toggle()
                            }
                        }
                    }
                }
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
    
    @ViewBuilder
    private func Player() -> some View {
        VStack {
            /// MARK: - MiniPlayer
            HStack {
                
                /// Cover
                SongImageView(imageData: viewModel.currentSong?.coverImage, size: frameImage)
                
                if !showFullPlayer {
                    
                    /// Description
                    VStack(alignment: .leading) {
                        SongDescription()
                    }
                    .matchedGeometryEffect(id: "Song Title", in: playerAnimation)
                    
                    Spacer()
                    
                    CustomButton(image: viewModel.isPlaying ? "pause.fill" : "play.fill", size: .title) {
                        viewModel.playPause()
                    }
                }
                
                
            }
            .padding()
            .background(showFullPlayer ? .clear : .black.opacity(0.3))
            .cornerRadius(10)
            .padding()
            
            /// MARK: - FullPlayer
            if showFullPlayer {
                /// Description
                VStack {
                    SongDescription()
                }
                .matchedGeometryEffect(id: "Song Title", in: playerAnimation)
                .padding(.top)
                
                VStack {
                    /// Duration
                    HStack {
                        Text("\(viewModel.durationFormatted(viewModel.currentTime))")
                            .artistFont()
                        Spacer()
                        Text("\(viewModel.durationFormatted(viewModel.totalTime))")
                            .artistFont()
                    }
                    .durationFont()
                    .padding()
                    
                    /// 
                       
                    Slider(value: $viewModel.currentTime, in: 0...viewModel.totalTime) { editing in
                        
                        if !editing {
                            viewModel.seekAudio(time: viewModel.currentTime)
                        }
                    }
                    .offset(y: -18)
                    .accentColor(.white)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            viewModel.updateProgress()
                        }
                    }
                    
                    HStack(spacing: 40) {
                        
                        CustomButton(image: "backward.end.fill", size: .title) {
                            viewModel.backward()
                        }
                        
                        CustomButton(image: viewModel.isPlaying ? "pause.circle.fill" : "play.circle.fill", size: .largeTitle) {
                            viewModel.playPause()
                        }
                        
                        CustomButton(image: "forward.end.fill", size: .title) {
                            viewModel.forward()
                        }
                    }
                }
                .padding(.horizontal, 40)
            }
        }
    }
    
    private func CustomButton(image: String, size: Font, action: @escaping () -> () ) -> some View {
        Button {
            action()
        }label: {
            Image(systemName: image)
                .foregroundColor(.white)
                .font(size)
        }
    }
    
    @ViewBuilder
    private func SongDescription() -> some View {
        if let currentSong = viewModel.currentSong {
            Text(currentSong.name)
                .nameFont()
            Text(currentSong.artist ?? "Unknown Artist")
                .artistFont()
        }
    }
}

#Preview {
    PlayerView()
}
