//
//  InquiryView.swift
//  AnBbang
//
//  Created by Hwang_Inyoung on 9/24/24.
//

import SwiftUI

struct InquiryView: View {
    var body: some View {
        VStack {
            Text("상담 문의한 방이 없습니다.")
            Text("관심있는 방을 문의 해보세요.")
        }
        .foregroundStyle(.gray)
        .navigationTitle("문의한 방")
    }
}

