//
//  SearchView.swift
//  AnBbang
//
//  Created by Jaemin Hong on 9/24/24.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    var category: String = ""
    var categoryImage: String = ""
    
    var body: some View {
        HStack(spacing: 5) {
            Spacer(minLength: 3)
            Button {
                print("Pressed Change type of house button")
            } label: {
                VStack(spacing: 0) {
                    Image(systemName: categoryImage)
                    Text(category)
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
    }
}

#Preview {
    SearchView(searchText: .constant(""))
}
