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
    var body: some View {
        TabView {
            Tab("홈", systemImage: "house.circle.fill") {
                HomeView()
            }
            
            Tab("관심목록", systemImage: "heart.circle.fill") {
                FavoritesView()  // 관심목록 탭에 연결
            }
            
            Tab("더보기", systemImage: "square.split.2x2.fill") {
                MoreView()
            }
        }
        .tint(.accent)
        .navigationBarBackButtonHidden()
    }
}

struct HomeView: View {
    @Bindable var residenceStore: ResidenceStore = ResidenceStore()
    var body: some View {
        NavigationStack {
            VStack {
                Image("anbbangLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 365, height: 70, alignment: .leading)
                
                Spacer()
                    .frame(height: 30)
                
                Grid {
                    GridRow {
                        NavigationLink {
                            EstateMapView()
                        } label: {
                            ResidenceCell(residence: Residence.gositel.rawValue, image: "bed.double.fill")
                        }
                        
                        NavigationLink {
                            EstateMapView()
                        } label: {
                            ResidenceCell(residence: Residence.oneRoom.rawValue, image: "house.fill")
                        }
                    }
                    
                    GridRow {
                        NavigationLink {
                            EstateMapView()
                        } label: {
                            ResidenceCell(residence: Residence.villaAndTwoRoom.rawValue, image: "building.2.fill")
                        }
                        
                        NavigationLink {
                            EstateMapView()
                        } label: {
                            ResidenceCell(residence: Residence.officetel.rawValue, image: "building.columns.fill")
                        }
                    }
                }
                
                Spacer()
                    .frame(height: 50)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(ResidenceStore.residences, id: \.id) { residence in
                            ResidenceDetail(residence: residence)
                        }
                    }
                }
                
                Spacer()
            }
            
            .padding(.leading, 20)
            .padding(.trailing, 20)
        }
    }
}

struct ResidenceCell: View {
    var residence: String
    var image: String
    
    var body: some View {
        VStack {
            Image(systemName: image)
                .padding(.top, 20)
            Text("\(residence)")
                .frame(minWidth: 175, minHeight: 50)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .font(.headline)
                .foregroundStyle(.accent)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(lineWidth: 1)
                .foregroundStyle(.gray)
                .frame(minHeight: 100)
        }
    }
}

// 관심 목록 탭 뷰
struct FavoritesView: View {
    var body: some View {
        LikelistView()
    }
}

struct ResidenceDetail: View {
    var residence: ResidenceInfo
    @State private var isFavorites: Bool = false
    @State private var heartImageName: String = "suit.heart"
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                Image(residence.images[0])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(alignment: .leading)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                Button {
                    isFavorites.toggle()
                } label: {
                    Image(systemName: isFavorites ? "heart.fill" : "heart")
                        .foregroundStyle(isFavorites ? .red : .white)
                }
                .padding(.top, 5)
                .padding(.trailing, 5)
                
            }
            .frame(width: 130, height: 130, alignment: .leading)
            
            VStack {
                NavigationLink {
                    ResidenceInfoView(residence: residence)
                } label: {
                    VStack(alignment: .leading) {
                        Text(residence.quickInfo.monthlyRent)
                            .background(Color.white)
                        Text(residence.residenceType)
                            .font(.caption)
                        Text(residence.subInfo)
                            .font(.caption)
                    }
                    .frame(width: 130)
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    MainView()
}
