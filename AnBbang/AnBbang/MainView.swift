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

struct HomeView: View {
    @EnvironmentObject var residenceStore: ResidenceStore
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image("anbbangLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 365, height: 70, alignment: .leading)
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Grid {
                        GridRow {
                            NavigationLink {
                                EstateMapView(residenceStore: residenceStore, category: "고시텔", categoryImage: "bed.double.fill")
                            } label: {
                                ResidenceCell(residence: Residence.gositel.rawValue, image: "bed.double.fill")
                            }
                            
                            NavigationLink {
                                EstateMapView(residenceStore: residenceStore, category: Residence.oneRoom.rawValue, categoryImage: "house.fill")
                            } label: {
                                ResidenceCell(residence: Residence.oneRoom.rawValue, image: "house.fill")
                            }
                        }
                        .padding(.bottom, 5)
                        
                        GridRow {
                            NavigationLink {
                                EstateMapView(residenceStore: residenceStore, category: Residence.villaAndTwoRoom.rawValue, categoryImage: "building.2.fill")
                            } label: {
                                ResidenceCell(residence: Residence.villaAndTwoRoom.rawValue, image: "building.2.fill")
                            }
                            
                            NavigationLink {
                                EstateMapView(residenceStore: residenceStore, category: Residence.officetel.rawValue, categoryImage: "building.columns.fill")
                            } label: {
                                ResidenceCell(residence: Residence.officetel.rawValue, image: "building.columns.fill")
                            }
                        }
                    }
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Image("event")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 365)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Text("이 근처 추천 매물")
                        .frame(width: 365, alignment: .leading)
                        .fontWeight(.bold)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(residenceStore.residences.indices) { index in
                                ResidenceDetail(residence: $residenceStore.residences[index], isVertical: true)
                            }
                        }
                    }
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
            }
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

struct ResidenceDetail: View {
    @EnvironmentObject var residenceStore: ResidenceStore
    @Binding var residence: ResidenceInfo
    @State var isVertical: Bool = false
    
    var body: some View {
        VStack {
            NavigationLink {
                ResidenceInfoView(residence: $residence)
            } label: {
                if isVertical {
                    VStack {
                        ResidenceDetailContent(residence: $residence, isVertsical: $isVertical)
                    }
                } else {
                    HStack {
                        ResidenceDetailContent(residence: $residence, isVertsical: $isVertical)
                            .padding(.leading, 20)
                        Spacer()
                    }
                }
            }
        }
    }
}

struct ResidenceDetailContent: View {
    @EnvironmentObject var residenceStore: ResidenceStore
    @Binding var residence: ResidenceInfo
    @State private var heartImageName: String = "suit.heart"
    @Binding var isVertsical: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(residence.images[0])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(alignment: .leading)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            Button {
                residenceStore.toggleFavorite(id: residence.id)
            } label: {
                Image(systemName: residence.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(residence.isFavorite ? .red : .white)
            }
            .padding(.top, 5)
            .padding(.trailing, 5)
            .zIndex(1)
        }
        .frame(width: 130, height: 130, alignment: .leading)
        
        if isVertsical {
            VStack(alignment: .leading, spacing: 10) {
                Text(residence.quickInfo.monthlyRent)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(residence.residenceType)
                    .font(.caption)
                Text(residence.subInfo)
                    .font(.caption)
            }
            .frame(width: 130, height: 100, alignment: .leading)
            .foregroundStyle(.black)
        } else {
            VStack(alignment: .leading, spacing: 15) {
                Text(residence.quickInfo.monthlyRent)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(residence.residenceType)
                    .font(.caption)
                Text(residence.subInfo)
                    .font(.caption)
                
                Spacer()
            }
            .frame(width: 200, height: 130, alignment: .leading)
            .foregroundStyle(.black)
            .padding(.leading, -10)
        }
    }
}

#Preview {
    MainView()
        .environment(ResidenceStore())
}
