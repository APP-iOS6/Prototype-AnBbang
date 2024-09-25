//
//  RoomListView.swift
//  AnBbang
//
//  Created by Hyunwoo Shin on 9/25/24.
//

import SwiftUI

struct RoomListView: View {
    @EnvironmentObject var residenceStore: ResidenceStore
    @Binding var isFavorite: Bool
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .frame(height: 10)
                ForEach(residenceStore.residences.indices) { index in
                    if isFavorite {
                        if residenceStore.residences[index].isFavorite {
                            ResidenceDetail(residence: $residenceStore.residences[index], isVertical: false)
                            Divider()
                                .frame(height: 10)
                        }
                    } else {
                        ResidenceDetail(residence: $residenceStore.residences[index], isVertical: false)
                        Divider()
                            .frame(height: 10)
                    }
                }
            }
            .navigationTitle(isFavorite ? "관심목록" : "더보기")
            .navigationBarTitleDisplayMode(.inline)
            .modifier(BackButtonModifier())
        }
    }
}

#Preview {
    MainView()
        .environment(ResidenceStore())
        .environment(RoomReviewStore())
}
