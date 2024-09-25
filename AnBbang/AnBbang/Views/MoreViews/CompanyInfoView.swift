//
//  CompanyInfoView.swift
//  AnBbang
//
//  Created by Hwang_Inyoung on 9/24/24.
//

import SwiftUI

struct CompanyInfoView: View {
    var body: some View {
        VStack {
            Text("안방과 함께한 사람들")
                .font(.largeTitle)
                .padding()
            Text("""
            프로젝트팀장 :  김승철
            개발팀장 :          신현우
            디자인팀장 :      박범규
            테스터팀장 :      홍재민
            비즈니스팀장 :  황인영
            """)
            .font(.title)
            
        }
        .navigationTitle("회사 소개")
    }
}

