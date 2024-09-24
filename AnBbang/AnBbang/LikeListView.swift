//
//  LikeListView.swift
//  AnBbang
//
//  Created by 박범규 on 9/24/24.
//

//
//  ContentView.swift
//  DetailView
//
//  Created by 박범규 on 9/24/24.
//

import SwiftUI
import Observation

struct LikelistView: View {
    
    // 각 항목의 관심 상태를 관리하기 위한 딕셔너리 (UUID 기반으로 관리)
    @EnvironmentObject var residenceStore: ResidenceStore
    @State private var favoriteItems: [UUID: Bool] = [:]
    @State private var isPresented: Bool = false
    @State private var selectedResidence: ResidenceInfo? = nil
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(residenceStore.favoritesResidences) { residence in
                    HStack{
                        NavigationLink {
                            ResidenceInfoView(residence: residence)
                        } label: {
                            HStack {
                                ZStack(alignment: .topTrailing) {
                                    Image(residence.images[0])  // 배열에서 이미지 이름 사용
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(alignment: .leading)
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                    
                                    // 하트를 위한 버튼
                                    Button(action: {
                                        residenceStore.toggleFavorite(id: residence.id)
                                        
                                        // 하트가 해제되면 리스트에서 해당 항목을 삭제
                                        if !residence.isFavorite {
                                            residenceStore.subFavoriteResidence(id: residence.id)
                                        }
                                    }) {
                                        Image(systemName: residence.isFavorite ? "heart.fill" : "heart")
                                            .foregroundColor(residence.isFavorite ? .red : .white)
                                            .padding(8)
                                    }
                                    .buttonStyle(PlainButtonStyle()) // 버튼 스타일을 기본으로 설정
                                }
                                .frame(width: 130, height: 130, alignment: .leading)
                                
                                VStack(alignment: .leading) {
                                    Text(residence.quickInfo.monthlyRent)
                                        .font(.headline)
                                        .padding(2)
                                    Text(residence.residenceType)  // 배열에서 설명 사용
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Text(residence.subInfo)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                            
                            .padding(.vertical, 8)
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("관심 목록")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            residenceStore.initFavoritesResidences()
        }
    }
    // 아이템을 삭제하는 함수
    private func removeItem(withID id: UUID) {
        residenceStore.residences.removeAll { $0.id == id }
        favoriteItems.removeValue(forKey: id)
    }
}


#Preview {
    LikelistView()
        .environment(ResidenceStore())
}
