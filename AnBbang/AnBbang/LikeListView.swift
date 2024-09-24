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

// 항목 모델 정의
struct ResidenceItem: Identifiable {
    let id = UUID()  // 고유한 ID를 부여
    let image: String
    let subTitle: String
    let description: String
}

struct LikelistView: View {
    // 항목들을 ResidenceItem 구조체로 저장
    @State private var items: [ResidenceItem] = [
        ResidenceItem(image: "TempRoom", subTitle: "월세 58/58", description: "원룸\n20.43m² * 3층 \n서초구 반포동\n"),
        ResidenceItem(image: "Room1", subTitle: "월세 70/70", description: "원룸\n23.43m² * 2층 \n강남구 역삼동\n"),
        ResidenceItem(image: "Room2", subTitle: "월세 2000/58", description: "원룸\n30.39m² * 3층 \n서초구 서초동\n"),
        ResidenceItem(image: "Room3", subTitle: "월세 80/80", description: "원룸\n20m² * 3층 \n서초구 양재동\n"),
        ResidenceItem(image: "Room4", subTitle: "월세 60/60", description: "원룸\n26.34m² * 3층 \n서초구 양재동\n"),
        ResidenceItem(image: "Room5", subTitle: "월세 3000/85", description: "원룸\n19.43m² * 3층 \n서초구 반포동\n"),
        ResidenceItem(image: "Room6", subTitle: "월세 200.135", description: "원룸\n38.25m² * 3층 \n강남구 개포동\n"),
        ResidenceItem(image: "Room7", subTitle: "월세 58/58", description: "원룸\n30.64m² * 3층 \n강남구 논현동\n"),
        ResidenceItem(image: "Room8", subTitle: "월세 75/75", description: "원룸\n26.33m² * 3층 \n서초구 반포동\n"),
        ResidenceItem(image: "Room1", subTitle: "월세 60/52", description: "원룸\n20.43m² * 3층 \n강남구 역삼동\n")
    ]
    
    // 각 항목의 관심 상태를 관리하기 위한 딕셔너리 (UUID 기반으로 관리)
    @State private var favoriteItems: [UUID: Bool] = [:]
    @State private var showModal: Bool = false
    @State private var selectedItem: ResidenceItem? = nil
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    HStack{
                        HStack {
                            ZStack(alignment: .topTrailing) {
                                Image(item.image)  // 배열에서 이미지 이름 사용
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(alignment: .leading)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                
                                // 하트를 위한 버튼
                                Button(action: {
                                    favoriteItems[item.id]?.toggle()
                                    
                                    // 하트가 해제되면 리스트에서 해당 항목을 삭제
                                    if favoriteItems[item.id] == false {
                                        removeItem(withID: item.id)
                                    }
                                }) {
                                    Image(systemName: favoriteItems[item.id] == true ? "heart.fill" : "heart")
                                        .foregroundColor(favoriteItems[item.id] == true ? .white : .white)
                                        .padding(8)
                                }
                                .buttonStyle(PlainButtonStyle()) // 버튼 스타일을 기본으로 설정
                            }
                            .frame(width: 130, height: 130, alignment: .leading)
                            
                            VStack(alignment: .leading) {
                                Text(item.subTitle)
                                    .font(.headline)
                                    .padding(2)
                                Text(item.description)  // 배열에서 설명 사용
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            
                        }
                        
                        .padding(.vertical, 8)
                        .onTapGesture {
                            selectedItem = item
                            showModal = true
                        }
                        
                        Button(action: {
                            removeItem(withID: item.id)
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                                .padding()
                                .frame(width: 44, height: 44)  // 터치 영역을 명시적으로 설정
                                .contentShape(Rectangle())  // 버튼의 터치 가능한 영역을 직사각형으로 확장
                            
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("관심 목록")
            .navigationBarTitleDisplayMode(.inline) // 네비게이션 타이틀 가운데 정렬
            .sheet(isPresented: $showModal) {
                if let selectedItem = selectedItem {
                    DetailView(item: selectedItem, favoriteItems: $favoriteItems, removeItem: removeItem)
                }
            }
            .onAppear {
                // 각 항목의 초기 관심 상태를 true로 설정
                items.forEach { item in
                    if favoriteItems[item.id] == nil {
                        favoriteItems[item.id] = true
                    }
                }
            }
        }
    }
    
    // 아이템을 삭제하는 함수
    private func removeItem(withID id: UUID) {
        items.removeAll { $0.id == id }
        favoriteItems.removeValue(forKey: id)
    }
}

struct DetailView: View {
    let item: ResidenceItem
    @Binding var favoriteItems: [UUID: Bool]
    var removeItem: (UUID) -> Void
    @State private var imageName: String = ""
    let roomImages = ["TempRoom", "TempRoom2", "TempRoom3"]
    @State private var isFavorites: Bool = false
    @State private var isPresented: Bool = false
    var checkDick: [String: String] = ["1. 계약 전\n 확인하기": "before", "2. 계약 당일\n 준비": "dDay", "3. 계약 후\n 확인하기": "after", "4. 이삿날\n 해야할 일": "move"]
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                Image(item.image)
                    .resizable()
                    .frame(maxHeight: 250)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
                Button {
                    favoriteItems[item.id]?.toggle()
                } label: {
                    Image(systemName: favoriteItems[item.id] == true ? "heart.fill" : "heart")
                        .foregroundColor(favoriteItems[item.id] == true ? .red : .white)
                        .padding(8)
                }
                .padding(.trailing, 20)
            }
            
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
                Text("월세 \(item.subTitle)")
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {
                    // 문의하기 동작
                } label: {
                    Text("문의하기")
                        .padding()
                        .background(Color.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                }
            }
            .padding(10)
        }
        .padding()
    }
}


#Preview {
    LikelistView()
}
