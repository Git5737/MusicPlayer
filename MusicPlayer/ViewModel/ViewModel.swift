//
//  ViewModel.swift
//  MusicPlayer
//
//  Created by mac on 01.10.2025.
//

import Foundation
internal import Combine
import AVFAudio


class ViewModel: ObservableObject {
    
    @Published var songs: [SongModel] = []
    @Published var audioPlayer: AVAudioPlayer?
    @Published var isPlaying = false
    
    func playAudio(song: SongModel) {
        do {
            self.audioPlayer = try AVAudioPlayer(data: song.data)
            self.audioPlayer?.play()
            isPlaying = true
        } catch {
            print("Error in audio playback: \(error)")
        }
    }
    
    
    func durationFormatted(_ duration: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: duration) ?? ""
    }
}
