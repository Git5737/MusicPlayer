//
//  ImportFileServise.swift
//  MusicPlayer
//
//  Created by mac on 01.10.2025.
//

import Foundation
import SwiftUI
import AVFoundation
import RealmSwift

struct ImportFileServise: UIViewControllerRepresentable {
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIDocumentPickerViewController{
        let picker = UIDocumentPickerViewController(documentTypes: ["public.audio"], in: .open)
        picker.allowsMultipleSelection = false
        picker.shouldShowFileExtensions = true
        picker.delegate = context.coordinator
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    class Coordinator: NSObject, UIDocumentPickerDelegate{
        
        var parent: ImportFileServise
        @ObservedResults(SongModel.self) var songs
        
        init(parent: ImportFileServise) {
            self.parent = parent
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            guard let url = urls.first, url.startAccessingSecurityScopedResource() else { return }
            
            defer { url.stopAccessingSecurityScopedResource() }
            
            do {
                
                let document = try Data(contentsOf: url)
                
                let asset = AVAsset(url: url)
                
                var song =  SongModel(name: url.lastPathComponent, data: document)
                
                let metadata = asset.metadata
                
                for item in metadata {
                    guard let key = item.commonKey?.rawValue, let value = item.value else { continue }
                    switch key {
                    case AVMetadataKey.commonKeyArtist.rawValue:
                        song.artist = value as? String
                    case AVMetadataKey.commonKeyArtwork.rawValue:
                        song.coverImage = value as? Data
                    case AVMetadataKey.commonKeyTitle.rawValue:
                        song.name = value as? String ?? song.name
                    default:
                        break
                    }
                }
                
                song.duration = CMTimeGetSeconds(asset.duration)
                
                let isDublicate = songs.contains {
                    $0.name == song.name && $0.artist == song.artist
                }
                
                if !isDublicate {
                    $songs.append(song)
                } else {
                    print("Song  with same value name already exist")
                }
                
            } catch {
                print("Error processisng the file: \(error)")
            }
        }
    }
}
