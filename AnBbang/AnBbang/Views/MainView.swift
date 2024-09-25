//
//  ContentView.swift
//  AnBbang
//
//  Created by Hyunwoo Shin on 9/24/24.
//

import SwiftUI

enum Residence: String {
    case gositel = "여성 전용 고시텔"
    case villaAndTwoRoom = "빌라/투룸+"
    case oneRoom = "원룸"
    case officetel = "오피스텔"
}

struct MainView: View {
    @EnvironmentObject var residenceStore: ResidenceStore
    
    var body: some View {
        TabView {
            Tab("홈", systemImage: "house.circle.fill") {
                HomeView()
            }
            
            Tab("관심목록", systemImage: "heart.circle.fill") {
                LikelistView()// 관심목록 탭에 연결
            }
            
            Tab("더보기", systemImage: "square.split.2x2.fill") {
                MoreView()
            }
        }
        .tint(.accent)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MainView()
        .environment(ResidenceStore())
        .environment(RoomReviewStore())
}
