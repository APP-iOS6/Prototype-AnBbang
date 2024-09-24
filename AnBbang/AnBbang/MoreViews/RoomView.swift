//
//  RoomView.swift
//  AnBbang
//
//  Created by Hwang_Inyoung on 9/24/24.
//

import SwiftUI

struct RoomView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("안방에서 편리하게")
                        .font(.title)
                    Spacer()
                }
                HStack {
                    Text("매물을 등록해보세요.")
                        .font(.title)
                }
            }
            .padding()
            
            Spacer()
            
            VStack(alignment: .leading) {
                HStack {
                    Text("월세 1개의 매물만 등록할 수 있으며,")
                    
                    Spacer()
                }
                HStack {
                    Text("등록한 매물은 30일간 노출됩니다.")
                }
                
                Spacer()
                
            }
            .font(.title3)
            .foregroundStyle(.gray)
            .padding()
            
            Button(action: {
                // 버튼 동작
            }) {
                Text("방 내놓기 시작")
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal) 
            
            Spacer()
        }
        .navigationTitle("방 내놓기")
        .modifier(BackButtonModifier())
    }
}

