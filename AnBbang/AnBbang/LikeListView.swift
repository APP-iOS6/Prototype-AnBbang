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
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                Image(item.image)  // 디테일 뷰에서도 이미지 사용
                    .resizable()
                    .frame(width: 200, height: 200)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
                Button(action: {
                    favoriteItems[item.id]?.toggle()
                    
                    // 하트가 해제되면 리스트에서 해당 항목을 삭제
                    if favoriteItems[item.id] == false {
                        removeItem(item.id)
                    }
                }) {
                    Image(systemName: favoriteItems[item.id] == true ? "heart.fill" : "heart")
                        .foregroundColor(favoriteItems[item.id] == true ? .yellow : .white)
                        .padding(8)
                }
                .buttonStyle(PlainButtonStyle()) // 버튼 스타일을 기본으로 설정
            }
            .frame(width: 200, height: 200)
            
            VStack(alignment: .leading, spacing: 16) {
                Text(item.subTitle)
                    .font(.largeTitle)
                    .bold()
                Text(item.description)  // 설명 사용
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    LikelistView()
}
