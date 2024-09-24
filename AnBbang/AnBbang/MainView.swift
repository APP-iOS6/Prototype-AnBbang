//
//  ContentView.swift
//  AnBbang
//
//  Created by Hyunwoo Shin on 9/24/24.
//

import SwiftUI

enum Residence: String {
    case apartment = "아파트"
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
            }
            
            Tab("더보기", systemImage: "square.split.2x2.fill") {
                MoreView()
            }
        }
        .tint(.yellow)
    }
}

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 365, height: 70, alignment: .leading)
                    
                Spacer()
                    .frame(height: 50)
                
                Grid {
                    GridRow {
                        NavigationLink {
                            
                        } label: {
                            ResidenceCell(residence: Residence.apartment.rawValue, image: "house.circle.fill")
                        }

                        NavigationLink {
                            
                        } label: {
                            ResidenceCell(residence: Residence.villaAndTwoRoom.rawValue, image: "house.lodge.circle.fill")
                        }
                    }
                    
                    GridRow {
                        NavigationLink {
                            
                        } label: {
                            ResidenceCell(residence: Residence.oneRoom.rawValue, image: "house.circle.fill")
                        }
                        
                        NavigationLink {
                            
                        } label: {
                            ResidenceCell(residence: Residence.officetel.rawValue, image: "house.circle.fill")
                        }
                    }
                }
                
                Spacer()
                    .frame(height: 50)
                
                ScrollView(.horizontal) {
                    HStack {
                        ResidenceDetail()
                        ResidenceDetail()
                        ResidenceDetail()
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
                .foregroundStyle(.black)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(lineWidth: 1)
                .foregroundStyle(.gray)
        }
    }
}

struct ResidenceDetail: View {
    @State private var isFavorites: Bool = false
    @State private var heartImageName: String = "suit.heart"
    
    var body: some View {
        VStack {
            ZStack {
                Image("TempRoom")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(alignment: .leading)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                Button {
                    isFavorites.toggle()
                    
                    if isFavorites {
                        heartImageName = "heart.fill"
                    } else {
                        heartImageName = "suit.heart"
                    }
                } label: {
                    Image(systemName: heartImageName)
                        .foregroundStyle(.white)
                        .frame(width: 120, height: 120, alignment: .topTrailing)
                }
                
            }
            .frame(width: 130, height: 130, alignment: .leading)
            
            VStack {
                Text("월세 300/30")
                    .background(Color.white)
                    .frame(width: 130, alignment: .leading)
                Text("원룸")
                    .font(.caption)
                    .frame(width: 130, alignment: .leading)
                Text("고층, 10.15m², 관리비 7만원")
                    .font(.caption)
                    .frame(width: 130, alignment: .leading)
                Text("Detail...")
                    .font(.caption)
                    .frame(width: 130, alignment: .leading)
            }
        }
    }
}

#Preview {
    MainView()
}
