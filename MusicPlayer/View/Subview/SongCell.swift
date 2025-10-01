//
//  SongCell.swift
//  MusicPlayer
//
//  Created by mac on 01.10.2025.
//

import SwiftUI

struct SongCell: View {
    var body: some View {
        HStack {
            Color.pink
                .frame(width: 60, height: 60)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text("Смарагдове небо")
                    .nameFont()
                Text("Drevo")
                    .artistFont()
            }
            
            Spacer()
            
            Text("3:56")
                .artistFont()
        }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
    }
}

#Preview {
    SongCell()
}
