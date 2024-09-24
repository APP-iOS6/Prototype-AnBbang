//
//  MoreView.swift
//  AnBbang
//
//  Created by Hwang_Inyoung on 9/24/24.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                
                Text("로그인 및 회원가입")
                    .font(.title)
                
                Divider()
                
                HStack {
                    Button {
                        
                    } label: {
                        VStack {
                            Image(systemName: "magnifyingglass.circle")
                                .font(.largeTitle)
                                .padding()
                            Text("문의한 방")
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        VStack {
                            Image(systemName: "sharedwithyou.circle")
                                .font(.largeTitle)
                                .padding()
                            Text("내가 쓴 이야기")
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        VStack {
                            Image(systemName: "info.circle")
                                .font(.largeTitle)
                                .padding()
                            Text("고객센터")
                        }
                    }
                }
                
                Divider()
                
                
                List {
                    Label("방 내놓기", systemImage: "house")
                    Label("허위매물 신고 내역", systemImage: "doc.text")
                    Label("이벤트", systemImage: "star")
                    Label("안방 새소식", systemImage: "bell.badge")
                    
                    
                    
                    Text("이용약관")
                    Text("개인정보 처리방침")
                    Text("회사 소개")
                }
                .listStyle(.inset)
                
                
            }
            .padding()
        }
    }
}

#Preview {
    MoreView()
}
