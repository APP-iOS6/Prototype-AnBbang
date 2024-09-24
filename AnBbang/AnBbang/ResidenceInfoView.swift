//
//  ResidenceInfoView.swift
//  AnBbang
//
//  Created by Hyunwoo Shin on 9/24/24.
//

import SwiftUI

struct ResidenceInfoView: View {
    @EnvironmentObject var residenceStore: ResidenceStore
    @Binding var residence: ResidenceInfo
    @State var isFavorite: Bool = false
    @State private var isPresented: Bool = false
    var checkDict: [String: String] = ["1. 계약 전\n 확인하기": "before", "2. 계약 당일\n 준비": "dDay", "3. 계약 후\n 확인하기": "after", "4. 이삿날\n 해야할 일": "move"]
    @State private var imageName: String = ""
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                RoomImagesView(roomImages: residence.images)
                
                Button {
                    residenceStore.toggleFavorite(id: residence.id)
                    isFavorite = residenceStore.getFavorites(id: residence.id)
                } label: {
                    Image(systemName: isFavorite == true ? "heart.fill" : "heart")
                        .foregroundStyle(isFavorite ? .red : .white)
                }
                .padding(.trailing, 20)
                .padding(.top, 90)
                .zIndex(1) 
            }
            .ignoresSafeArea()
            .frame(maxHeight: 150)
            
            ScrollView {
                HStack {
                    Text(residence.registNumber)
                        .padding(4)
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .foregroundStyle(.white)
                        .font(.caption)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text(residence.registDate)
                        .font(.caption2)
                        .foregroundStyle(.gray)
                }
                .padding(10)
                
                Divider()
                
                HStack {
                    Image(systemName: "person.crop.circle")
                    
                    Text(residence.realEstateAgent.name)
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "star.fill")
                        
                        let stringRating = String(format: "%.1f", residence.realEstateAgent.rating)
                        
                        Text(stringRating)
                    }
                }
                .padding(.leading, 10)
                .padding(.trailing, 10)
                
                Divider()
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(residence.quickInfo.adress)
                            .font(.caption)
                        Text(residence.quickInfo.monthlyRent)
                            .fontWeight(.bold)
                            .font(.title2)
                        Text(residence.quickInfo.maintenanceCost)
                            .font(.caption)
                    }
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("거실 넓은 최신축")
                            .font(.headline)
                        Text("10.15m²")
                            .fontWeight(.bold)
                        Text("분리형 원룸 (욕실 1개)")
                        Text("3층/4층")
                        Text("즉시 입주 가능")
                        Text("총 주차 대수 5대")
                        Text("남동향")
                        Text("엘리베이터 없음")
                        Text("단독주택")
                        Text("20190618 준공")
                        Text("경산시 압량읍 부적리")
                    }
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(residence.maintenanceCost.cost)
                            .fontWeight(.bold)
                            .font(.title3)
                        Text(residence.maintenanceCost.detail)
                        .lineSpacing(10)
                    }
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("옵션 정보")
                            .fontWeight(.bold)
                            .font(.title3)
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 45) {
                                ForEach(residence.options) { option in
                                    VStack {
                                        Image(systemName: option.image)
                                        Text(option.name)
                                    }
                                }
                            }
                            .padding(5)
                        }
                    }
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                   
                    Divider()
                    
                    Text(residence.roomDescription)
                    .lineSpacing(5)
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                }
                .padding(.leading, 10)
                
                Divider()
                
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(checkDict.sorted(by: <), id: \.key) { key, value in
                            Button {
                                switch value {
                                case "before":
                                    imageName = "before"
                                case "dDay":
                                    imageName = "dDay"
                                case "after":
                                    imageName = "after"
                                default:
                                    imageName = "move"
                                }
                                
                                if !imageName.isEmpty {
                                    isPresented.toggle()
                                }
                            } label: {
                                Text(key)
                                    .frame(width: 100)
                                    .padding(10)
                                    .background(Color.yellow)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .foregroundStyle(.white)
                                    .fontWeight(.bold)
                            }
                        }
                    }
                    .sheet(isPresented: $isPresented) {
                        CheckView(imageName: $imageName)
                    }
                    .padding()
                }
            }
            
            HStack {
                Text(residence.quickInfo.monthlyRent)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("문의하기")
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                        .padding(.leading, 60)
                        .padding(.trailing, 60)
                        .background(Color.accent)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                }
            }
            .padding(10)
            
            
        }
        .onAppear {
            isFavorite = residenceStore.getFavorites(id: residence.id)
        }
        .modifier(BackButtonModifier())
    }
}

struct CheckView: View {
    @Binding var imageName: String
    
    var body: some View {
        ScrollView {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
    }
}

#Preview {
    MainView()
        .environment(ResidenceStore())
}
