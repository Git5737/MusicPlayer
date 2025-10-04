//
//  SongImageView.swift
//  MusicPlayer
//
//  Created by mac on 04.10.2025.
//

import SwiftUI

struct SongImageView: View {
    
    let imageData: Data?
    let size: CGFloat
    
    var body: some View {
        if let data = imageData, let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .frame(width: size, height: size)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
        } else {
            ZStack {
                Color.gray
                    .frame(width: size, height: size)
                Image(systemName: "music.note")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: size / 2)
                    .foregroundStyle(.white)
            }
            .cornerRadius(10)
        }
    }
}

#Preview {
    SongImageView(imageData: Data(), size: 200)
}
