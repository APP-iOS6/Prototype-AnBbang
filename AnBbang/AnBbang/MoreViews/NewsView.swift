//
//  NewsView.swift
//  AnBbang
//
//  Created by Hwang_Inyoung on 9/24/24.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("24.09.24 업데이트")
                .padding(.vertical)
            Text("주택/빌라 건물 세대정보 제공")
                .font(.largeTitle)
                .padding(.vertical)
            Text("""
                이제 매물의 건축물대장 기반 정보로 한층에 몇 세대가
                있는지, 평형구성은 어떻게 되는지 등의 간단한 건물
                정보를 확인할 수 있습니다.
                """)
        }
        .navigationTitle("안방 새소식")
    }
}

