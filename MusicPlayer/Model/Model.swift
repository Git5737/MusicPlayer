//
//  Model.swift
//  MusicPlayer
//
//  Created by mac on 01.10.2025.
//

import Foundation

struct SongModel: Identifiable {
    let id = UUID()
    let name: String
    let data: Data
    let artist: String?
    let coverImage: Data?
    let duration: TimeInterval?
}
