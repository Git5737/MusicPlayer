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
                        SongCell(song: song, durationFormatter: viewModel.durationFormatted)
                            .onTapGesture {
                                viewModel.playAudio(song: song)
                            }
                    }
                    .listStyle(.plain)
                    
                    Spacer()
                    
                    // MARK: - Player
                    VStack {
                        /// MARK: - MiniPlayer
                        HStack {
                            Color.white
                                .frame(width: frameImage, height: frameImage)
                            
                            if !showFullPlayer {
                                VStack(alignment: .leading) {
                                    Text("Name")
                                        .nameFont()
                                    Text("Unknown Artist")
                                        .artistFont()
                                }
                                .matchedGeometryEffect(id: "Song Title", in: playerAnimation)
                                
                                Spacer()
                                
                                CustomButton(image: "play.fill", size: .title) {
                                    //action
                                }
                            }
                            
                            
                        }
                        .padding()
                        .background(showFullPlayer ? .clear : .black.opacity(0.3))
                        .cornerRadius(10)
                        .padding()
                        
                        /// MARK: - FullPlayer
                        
                        if showFullPlayer {
                            VStack {
                                VStack(alignment: .leading) {
                                    Text("Name")
                                        .nameFont()
                                    Text("Unknown Artist")
                                        .artistFont()
                                }
                            }.matchedGeometryEffect(id: "Song Title", in: playerAnimation)
                                .padding(.top)
                            
                            VStack {
                                HStack {
                                    Text("00:00")
                                        .artistFont()
                                    Spacer()
                                    Text("03:52")
                                        .artistFont()
                                }
                                .durationFont()
                                .padding()
                                   
                                Divider()
                                
                                HStack(spacing: 40) {
                                    
                                    CustomButton(image: "backward.end.fill", size: .title) {
                                        // action
                                    }
                                    
                                    CustomButton(image: "play.circle.fill", size: .largeTitle) {
                                        // aciton
                                    }
                                    
                                    
                                    CustomButton(image: "forward.end.fill", size: .title) {
                                        // action
                                    }
                                }
                            }
                            .padding(.horizontal, 40)
                        }
                    }
                    .frame(height: showFullPlayer ? UIScreen.main.bounds.height + SizeConstant.fullPlayer : SizeConstant.miniPlayer)
                    .onTapGesture {
                        withAnimation(.spring) {
                            self.showFullPlayer.toggle()
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
    
    private func CustomButton(image: String, size: Font, action: @escaping () -> () ) -> some View {
        Button {
            action()
        }label: {
            Image(systemName: image)
                .foregroundColor(.white)
                .font(size)
        }
    }
}

#Preview {
    PlayerView()
}
