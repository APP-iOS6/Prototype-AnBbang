//
//  ResidenceInfoView.swift
//  AnBbang
//
//  Created by Hyunwoo Shin on 9/24/24.
//

import SwiftUI

struct ResidenceInfoView: View {
    @Bindable var residenceStore: ResidenceStore = ResidenceStore()
    let roomImages = ["TempRoom", "TempRoom2", "TempRoom3"]
    @State private var isFavorites: Bool = false
    @State private var isPresented: Bool = false
    var checkDick: [String: String] = ["1. 계약 전\n 확인하기": "before", "2. 계약 당일\n 준비": "dDay", "3. 계약 후\n 확인하기": "after", "4. 이삿날\n 해야할 일": "move"]
    @State private var imageName: String = ""
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                RoomImagesView(roomImages: roomImages)
                
                Button {
                    isFavorites.toggle()
                } label: {
                    Image(systemName: isFavorites ? "heart.fill" : "heart")
                        .foregroundStyle(isFavorites ? .red : .white)
                }
                .padding(.trailing, 20)
            }
            .frame(maxHeight: 250)
            
            ScrollView {
                HStack {
                    Text("등록번호 : 12345678")
                        .padding(4)
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .foregroundStyle(.white)
                        .font(.caption)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("3일 전")
                        .font(.caption2)
                        .foregroundStyle(.gray)
                }
                .padding(10)
                
                Divider()
                
                HStack {
                    Image(systemName: "person.crop.circle")
                    
                    Text("LAB 5 공인중개사사무소")
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "star.fill")
                        
                        Text("4.9")
                    }
                }
                .padding(.leading, 10)
                .padding(.trailing, 10)
                
                Divider()
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("경상북도 경산시 압량읍")
                            .font(.caption)
                        Text("월세 500/30")
                            .fontWeight(.bold)
                            .font(.title2)
                        Text("관리비 7만원")
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
                        Text("월 관리비 70,000원")
                            .fontWeight(.bold)
                            .font(.title3)
                        Text("""
                             최근 1년 관리비 평균금액 기준으로 산정
                             - 부과방식 : 정액관리비
                             - 일반(공용)관리비 : 70,000원
                             - 인터넷 사용료 : 의뢰인 미제공
                             - 수도료: 의뢰인 미제공
                             - TV사용료 : 의뢰인 미제공
                             - 기타관리비 : 의뢰인 미제공
                             """)
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
                                VStack {
                                    Image(systemName: "refrigerator")
                                    Text("세탁기")
                                }
                                
                                VStack {
                                    Image(systemName: "sink")
                                    Text("싱크대")
                                }
                                
                                VStack {
                                    Image(systemName: "air.conditioner.horizontal")
                                    Text("에어컨")
                                }
                                
                                VStack {
                                    Image(systemName: "shoe.2")
                                    Text("신발장")
                                }
                                
                                VStack {
                                    Image(systemName: "hanger")
                                    Text("옷장")
                                }
                                
                                VStack {
                                    Image(systemName: "bed.double")
                                    Text("침대")
                                }
                                
                                VStack {
                                    Image(systemName: "stove")
                                    Text("가스렌지")
                                }
                                
                                VStack {
                                    Image(systemName: "studentdesk")
                                    Text("책상")
                                }
                            }
                            .padding(5)
                        }
                    }
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                   
                    Divider()
                    
                    Text("""
                         이 방이 어쩌고 저쩌고 그래서 좋습니다.
                         옵션도 낭낭해요.
                         주차도 편안해요.
                         제가 살고싶을만큼!
                         """)
                    .lineSpacing(5)
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                }
                .padding(.leading, 10)
                
                Divider()
                
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(checkDick.sorted(by: <), id: \.key) { key, value in
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
                Text("월세 500/30")
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("문의하기")
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                        .padding(.leading, 60)
                        .padding(.trailing, 60)
                        .background(Color.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                }
            }
            .padding(10)
            
            
        }
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
    ResidenceInfoView()
}
