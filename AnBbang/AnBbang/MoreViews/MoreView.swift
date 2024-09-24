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
            ScrollView {
                VStack {
                    // 로그인 및 회원가입 섹션
                    Text("로그인 및 회원가입")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding(.top)
                    
                    Divider()
                    
                    // 버튼 섹션
                    HStack {
                        NavigationLink(destination: InquiryView()) {
                            VStack {
                                Image(systemName: "magnifyingglass.circle")
                                    .font(.largeTitle)
                                    .padding()
                                Text("문의한 방")
                                    .foregroundColor(.black)
                            }
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: MyPostsView()) {
                            VStack {
                                Image(systemName: "sharedwithyou.circle")
                                    .font(.largeTitle)
                                    .padding()
                                Text("내가 쓴 이야기")
                                    .foregroundColor(.black)
                            }
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: CustomerSupportView()) {
                            VStack {
                                Image(systemName: "info.circle")
                                    .font(.largeTitle)
                                    .padding()
                                Text("고객센터")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    // 리스트 항목들 (왼쪽 정렬)
                    VStack(alignment: .leading) {
                        NavigationLink(destination: RoomView()) {
                            HStack {
                                Label("방 내놓기", systemImage: "house")
                                    .foregroundColor(.black)
                                Spacer() // 왼쪽 정렬을 위해 추가
                            }
                        }
                        .padding(.vertical)
                        
                        NavigationLink(destination: ReportView()) {
                            HStack {
                                Label("허위매물 신고 내역", systemImage: "doc.text")
                                    .foregroundColor(.black)
                                Spacer() // 왼쪽 정렬을 위해 추가
                            }
                        }
                        .padding(.vertical)
                        
                        NavigationLink(destination: EventView()) {
                            HStack {
                                Label("이벤트", systemImage: "star")
                                    .foregroundColor(.black)
                                Spacer() // 왼쪽 정렬을 위해 추가
                            }
                        }
                        .padding(.vertical)
                        
                        NavigationLink(destination: NewsView()) {
                            HStack {
                                Label("안방 새소식", systemImage: "bell.badge")
                                    .foregroundColor(.black)
                                Spacer() // 왼쪽 정렬을 위해 추가
                            }
                        }
                        .padding(.vertical)
                        
                        // 약관 및 회사 소개
                        NavigationLink(destination: TermsView()) {
                            HStack {
                                Text("이용약관")
                                    .foregroundColor(.gray)
                                Spacer() // 왼쪽 정렬을 위해 추가
                            }
                        }
                        .padding(.vertical)
                        
                        NavigationLink(destination: PrivacyPolicyView()) {
                            HStack {
                                Text("개인정보 처리방침")
                                    .foregroundColor(.gray)
                                Spacer() // 왼쪽 정렬을 위해 추가
                            }
                        }
                        .padding(.vertical)
                        
                        NavigationLink(destination: CompanyInfoView()) {
                            HStack {
                                Text("회사 소개")
                                    .foregroundColor(.gray)
                                Spacer() // 왼쪽 정렬을 위해 추가
                            }
                        }
                        .padding(.vertical)
                    }
                    .font(.title3)
                }
                .padding()
            }
            .navigationBarTitle("더보기", displayMode: .inline)
        }
    }
}

#Preview {
    MoreView()
}
