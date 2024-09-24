//
//  MyPostsView.swift
//  AnBbang
//
//  Created by Hwang_Inyoung on 9/24/24.
//

import SwiftUI

struct MyPostsView: View {
    var body: some View {
        VStack {
            Text("내가 쓴 이야기가 없습니다.")
                .foregroundStyle(.gray)
        }
        .navigationTitle("내가 쓴 이야기")
        .modifier(BackButtonModifier())
    }
}

