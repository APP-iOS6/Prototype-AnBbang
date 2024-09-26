//
//  LikeListView.swift
//  AnBbang
//
//  Created by 박범규 on 9/24/24.
//

import SwiftUI
import Observation

struct LikelistView: View {
    @State private var isFavorite: Bool = true
    
    var body: some View {
        NavigationStack {
            RoomListView(isFavorite: $isFavorite)
        }
    }
}

#Preview {
    MainView()
        .environment(ResidenceStore())
        .environment(RoomReviewStore())
}
