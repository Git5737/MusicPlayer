//
//  Model.swift
//  MusicPlayer
//
//  Created by mac on 01.10.2025.
//

import Foundation

struct SongModel: Identifiable {
    var id = UUID()
    var name: String
    var data: Data
    var artist: String?
    var coverImage: Data?
    var duration: TimeInterval?
}
