//
//  SearchView.swift
//  AnBbang
//
//  Created by Jaemin Hong on 9/24/24.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    var category: String  // 초기 카테고리
    var categoryImage: String  // 초기 카테고리 이미지
    
    // 드롭다운 상태를 관리하는 변수
    @State private var showDropdown: Bool = false
    @State private var selectedImage: String  // 선택된 이미지 저장
    @State private var selectedCategory: String  // 선택된 카테고리 저장
    
    // 이미지와 카테고리 리스트
    let imageOptions: [(image: String, category: String)] = [
        ("bed.double.fill", "고시텔"),
        ("house", "원룸"),
        ("building.2", "투룸/빌라"),
        ("building.columns.fill", "오피스텔"),
    ]
    
    init(searchText: Binding<String>, category: String = "고시텔", categoryImage: String = "bed.double.fill") {
        self._searchText = searchText
        self.category = category
        self.categoryImage = categoryImage
        // 초기 선택값을 전달받은 값으로 설정
        self._selectedImage = State(initialValue: categoryImage)
        self._selectedCategory = State(initialValue: category)
    }
    
    var body: some View {
        VStack(alignment: .leading) {  // VStack을 왼쪽 정렬
            HStack(spacing: 5) {
                Spacer(minLength: 3)
                
                // 이미지 선택 버튼
                Button {
                    withAnimation {
                        showDropdown.toggle()  // 드롭다운 표시/숨기기 토글
                    }
                } label: {
                    VStack(spacing: 0) {
                        Image(systemName: selectedImage)  // 선택된 이미지 표시
                        Text(selectedCategory)
                            .fontWeight(.bold)
                    }
                    .font(.subheadline)
                    .frame(width: 75, height: 40)
                    .background(.accent)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                }
                
                RoundedRectangleWithShadowBackground(frame: CGSize(width: 300, height: 40)) {
                    TextField(text: $searchText, prompt: Text("지역, 지하철, 대학, 단지")) {
                        Text(searchText)
                    }
                    .padding(.leading, 15)
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .foregroundStyle(.black)
                        .frame(width: 18, height: 18)
                        .padding(.leading, 250)
                }
            }
            
            if showDropdown {
                VStack(alignment: .leading) {  // 드롭다운 메뉴도 왼쪽 정렬
                    ForEach(imageOptions, id: \.image) { option in
                        Button {
                            selectedImage = option.image  // 선택된 이미지 업데이트
                            selectedCategory = option.category  // 선택된 카테고리 업데이트
                            withAnimation {
                                showDropdown.toggle()  // 드롭다운 숨기기
                            }
                        } label: {
                            HStack {
                                Image(systemName: option.image)
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding(5)
                                Text(option.category)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, minHeight: 40, alignment: .leading)  // 왼쪽 정렬
                            .background(Color(.systemGray6))
                            .cornerRadius(5)
                        }
                    }
                }
                .frame(maxWidth: 150, alignment: .leading)  // 왼쪽에 고정
                .background(Color.white)
                .cornerRadius(5)
                .shadow(radius: 5)
                .transition(.opacity.combined(with: .move(edge: .top)))
                .padding(.top, -8)  // 버튼과 드롭다운의 간격을 조정
            }
        }
        .padding(.horizontal)
    }
}


#Preview {
    SearchView(searchText: .constant(""), category: "원룸", categoryImage: "house")
}
