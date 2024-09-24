//
//  LikeListView.swift
//  AnBbang
//
//  Created by 박범규 on 9/24/24.
//

import SwiftUI
import Observation

struct LikelistView: View {
    @EnvironmentObject var residenceStore: ResidenceStore
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Divider()
                        .frame(height: 10)
                    ForEach(residenceStore.residences.indices) { index in
                        if residenceStore.residences[index].isFavorite {
                            ResidenceDetail(residence: $residenceStore.residences[index], isVertical: false)
                            
                            Divider()
                                .frame(height: 10)
                        }
                    }
                    
                }
                .navigationTitle("관심 목록")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    // 아이템을 삭제하는 함수
    private func removeItem(withID id: UUID) {
        residenceStore.residences.removeAll { $0.id == id }
    }
}

#Preview {
    MainView()
        .environment(ResidenceStore())
}
