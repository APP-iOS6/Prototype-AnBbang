//
//  MoreRoomsView.swift
//  AnBbang
//
//  Created by Hyunwoo Shin on 9/25/24.
//

import SwiftUI

struct MoreRoomsView: View {
    @State var isFavorite: Bool = false
    
    var body: some View {
        RoomListView(isFavorite: $isFavorite)
    }
}
