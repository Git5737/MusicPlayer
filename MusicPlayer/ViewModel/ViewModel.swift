//
//  ViewModel.swift
//  MusicPlayer
//
//  Created by mac on 01.10.2025.
//

import Foundation
internal import Combine


class ViewModel: ObservableObject {
    
    @Published var songs: [SongModel] = [
        SongModel(
            name: "Chop Suye",
            data: Data(),
            artist: "System",
            coverImage: Data(),
            duration: 1
        ),
        SongModel(
            name: "Chop",
            data: Data(),
            artist: "Well",
            coverImage: Data(),
            duration: 1
        ),
        SongModel(
            name: "Suye",
            data: Data(),
            artist: "System",
            coverImage: Data(),
            duration: 1
        )
    ]
}
