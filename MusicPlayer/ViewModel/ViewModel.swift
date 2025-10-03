//
//  ViewModel.swift
//  MusicPlayer
//
//  Created by mac on 01.10.2025.
//

import Foundation
import Combine
import AVFAudio


class ViewModel: ObservableObject {
    
    @Published var songs: [SongModel] = []
    @Published var audioPlayer: AVAudioPlayer?
    @Published var isPlaying = false
    @Published var currentIndex: Int?
    @Published var currentTime: TimeInterval = 0.0
    @Published var totalTime: TimeInterval = 0.0
    
    var currentSong: SongModel? {
        guard let currentIndex = currentIndex, songs.indices.contains(currentIndex) else {
            return nil
        }
        return songs[currentIndex]
    }
    
    func playAudio(song: SongModel) {
        do {
            self.audioPlayer = try AVAudioPlayer(data: song.data)
            self.audioPlayer?.play()
            isPlaying = true
            totalTime = audioPlayer?.duration ?? 0.0
            
            if let index =  songs.firstIndex(where: { $0.id == song.id}) {
                currentIndex = index
            }
            
        } catch {
            print("Error in audio playback: \(error)")
        }
    }
    
    func playPause() {
        if isPlaying {
            self.audioPlayer?.pause()
        } else {
            self.audioPlayer?.play()
        }
        isPlaying.toggle()
    }
    
    func seekAudio(time: TimeInterval) {
        audioPlayer?.currentTime = time
    }
    
    func updateProgress() {
        guard let player = audioPlayer else { return }
        currentTime = player.currentTime
    }
    
    func durationFormatted(_ duration: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: duration) ?? ""
    }
}
