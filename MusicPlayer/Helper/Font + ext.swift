//
//  Font + ext.swift
//  MusicPlayer
//
//  Created by mac on 01.10.2025.
//

import SwiftUI

extension Text{
    func nameFont() -> some View {
        self
            .foregroundStyle(.white)
            .font(.system(size: 16, weight: .semibold, design: .rounded))
    }
    
    func artistFont() -> some View {
        self
            .foregroundStyle(.white)
            .font(.system(size: 14, weight: .light, design: .rounded))
    }
}
