//
//  ViewModel.swift
//  MusicPlayer
//
//  Created by mac on 01.10.2025.
//

import Foundation
internal import Combine


class ViewModel: ObservableObject {
    
    @Published var songs: [SongModel] = []
}
