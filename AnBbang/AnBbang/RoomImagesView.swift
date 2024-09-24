//
//  RoomImagesView.swift
//  AnBbang
//
//  Created by Hyunwoo Shin on 9/24/24.
//

import SwiftUI

struct RoomImagesView: View {
    let roomImages: [String]
    
    var body: some View {
        TabView {
            ForEach(roomImages, id: \.self) { roomImage in
                Image(roomImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .ignoresSafeArea()
    }
}

#Preview {
    ResidenceInfo()
}
