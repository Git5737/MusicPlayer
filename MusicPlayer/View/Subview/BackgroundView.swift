//
//  BackgroundView.swift
//  MusicPlayer
//
//  Created by mac on 01.10.2025.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View{
        LinearGradient(
            colors:[.appTopBack,.appTopBottom],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ).ignoresSafeArea()
    }
}
 

#Preview {
    BackgroundView()
}
