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
                    // 네비게이션 링크를 사용하여 화면 전환
                    NavigationLink(destination: RoomView()) {
                        Label("방 내놓기", systemImage: "house")
                    }
                    
                    NavigationLink(destination: ReportView()) {
                        Label("허위매물 신고 내역", systemImage: "doc.text")
                    }
                    
                    NavigationLink(destination: EventView()) {
                        Label("이벤트", systemImage: "star")
                    }
                    
                    NavigationLink(destination: NewsView()) {
                        Label("안방 새소식", systemImage: "bell.badge")
                    }
                    
                    // 약관 및 회사 소개
                    NavigationLink(destination: TermsView()) {
                        Text("이용약관")
                    }
                    
                    NavigationLink(destination: PrivacyPolicyView()) {
                        Text("개인정보 처리방침")
                    }
                    
                    NavigationLink(destination: CompanyInfoView()) {
                        Text("회사 소개")
                    }
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
