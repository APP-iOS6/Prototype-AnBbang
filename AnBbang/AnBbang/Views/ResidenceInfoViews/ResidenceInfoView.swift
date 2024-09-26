//
//  ResidenceInfoView.swift
//  AnBbang
//
//  Created by Hyunwoo Shin on 9/24/24.
//

import SwiftUI

struct ResidenceInfoView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var roomReviewStore: RoomReviewStore
    @EnvironmentObject var residenceStore: ResidenceStore
    @Binding var residence: ResidenceInfo
    @State var isFavorite: Bool = false
    @State private var isPresented: Bool = false
    var checkDict: [String: String] = ["1. 계약 전\n 확인하기": "before", "2. 계약 당일\n 준비": "dDay", "3. 계약 후\n 확인하기": "after", "4. 이삿날\n 해야할 일": "move"]
    @State private var imageName: String = ""
    var isSheet: Bool
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                RoomImagesView(roomImages: residence.images)
                
                if isSheet {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle")
                            .foregroundStyle(.white)
                            .padding(.trailing, 20)
                            .padding(.top, screenBounds!.height / 20)
                    }
                }
            }
            .ignoresSafeArea()
            .frame(maxHeight: 150)
            
            ScrollView {
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(residence.quickInfo.address)
                            .font(.caption)
                        Text(residence.quickInfo.monthlyRent)
                            .fontWeight(.bold)
                            .font(.title2)
                    }
                    
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        NavigationLink {
                            RoomReviewView(residence: $residence)
                        } label: {
                            VStack(spacing: 5) {
                                HStack {
                                    Spacer()
                                    Image(systemName: "star.fill")
                                        .foregroundStyle(.yellow)
                                        .fontWeight(.bold)
                                    
                                    let stringRating = String(format: "%.1f", roomReviewStore.calculateAverageRating())
                                    
                                    Text(stringRating)
                                        .foregroundStyle(.accent)
                                        .fontWeight(.bold)
                                        .padding(.trailing, 15)
                                }
                                
                                HStack {
                                    Spacer()
                                    
                                    Text("사용자 리뷰 보기 ＞")
                                        .foregroundStyle(.accent)
                                        .fontWeight(.bold)
                                }
                            }
                        }
                    }
                }
                .padding(10)
                
                Divider()
                
                VStack(alignment: .leading) {
                    VStack {
                        Text(residence.maintenanceCost.cost)
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("여성 안심 시설")
                            .fontWeight(.bold)
                        Text("- CCTV 설치 대수(반경 500m) 이내 : 37대")
                        Text("- 경찰서(지구대) 거리 : 500m")
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("- 거실 넓은 최신축")
                            .font(.headline)
                        Text("- 면적 : 10.15m²")
                            .fontWeight(.bold)
                        Text("- 주거형태 : 분리형 원룸 (욕실 1개)")
                        Text("- 층수 : 3층/4층")
                        Text("- 입주 가능일 : 즉시 입주 가능")
                        Text("- 주차 : 총 주차 대수 5대")
                        Text("- 주택 방향 : 남동향")
                        Text("- 엘리베이터 : 엘리베이터 없음")
                        Text("- 건축물 용도 : 단독주택")
                        Text("- 준공일 : 20190618 준공")
                        Text("- 주소 : 경산시 압량읍 부적리")
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
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("등록번호 \(residence.registNumber)")
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .foregroundStyle(.gray)
                            .font(.caption)
                            .fontWeight(.bold)
                        Text("매물 등록일: \(residence.registDate)")
                            .font(.caption2)
                            .foregroundStyle(.gray)
                    }
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "person.crop.circle")
                        
                        Text(residence.realEstateAgent.name)
                        
                        Spacer()
                        
                        VStack {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                            
                            let stringRating = String(format: "%.1f", residence.realEstateAgent.rating)
                            
                            Text(stringRating)
                        }
                    }
                    .padding(.trailing, 10)
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
                                    .background(Color.accent)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .foregroundStyle(.white)
                                    .fontWeight(.bold)
                            }
                        }
                    }
                    .sheet(isPresented: $isPresented) {
                        CheckView(imageName: $imageName)
                    }
                    .padding(10)
                }
            }
            
            HStack {
                Text(residence.quickInfo.monthlyRent)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {
                    residenceStore.toggleFavorite(id: residence.id)
                    isFavorite = residenceStore.getFavorites(id: residence.id)
                } label: {
                    HStack(spacing: 0) {
                        Text("즐겨찾기")
                            .foregroundStyle(Color(UIColor.systemBackground))
                        Image(systemName: isFavorite == true ? "heart.fill" : "heart")
                            .foregroundStyle(isFavorite ? .red : .white)
                    }
                }
                .padding(.top, 10)
                .padding(.bottom, 10)
                .padding(.leading, 20)
                .padding(.trailing, 12)
                .background(.accent)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .foregroundStyle(.white)
                .fontWeight(.bold)
                
                Button {
                    
                } label: {
                    Text("문의하기")
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                        .padding(.leading, 26)
                        .padding(.trailing, 26)
                        .background(.accent)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                }
            }
            .padding(10)
        }
        .onAppear {
            isFavorite = residenceStore.getFavorites(id: residence.id)
            print("\(residence.registNumber)")
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
        .environment(RoomReviewStore())
}
