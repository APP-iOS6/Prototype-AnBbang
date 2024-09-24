//
//  MoreView.swift
//  AnBbang
//
//  Created by Hwang_Inyoung on 9/24/24.
//

import SwiftUI

struct MoreView: View {
    // 로그인 상태를 관리하는 변수
    @State private var isLoggedIn = true // 임시로 false로 설정
    @State private var userName = "구아바" // 로그인한 사용자의 닉네임
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // 로그인 상태에 따라 다른 뷰 표시
                    if isLoggedIn {
                        HStack {
                            Image(systemName: "person.circle") // 프로필 아이콘
                                .font(.largeTitle)
                                .foregroundColor(.black)
                            Text(userName) // 로그인된 사용자 닉네임
                                .font(.title)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                        }
                        .padding(.top)
                    } else {
                        Text("로그인 및 회원가입") // 로그인 안된 경우
                            .font(.title)
                            .foregroundColor(.black)
                            .padding(.top)
                    }
                    
                    Divider() // 구분선
                    
                    // 버튼 섹션
                    HStack {
                        // 문의한 방 버튼
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
                        
                        // 내가 쓴 이야기 버튼
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
                        
                        // 고객센터 버튼
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
                    
                    Divider() // 구분선
                    
                    // 리스트 항목들 (왼쪽 정렬)
                    VStack(alignment: .leading) {
                        // 방 내놓기 버튼
                        VStack {
                            NavigationLink(destination: RoomView()) {
                                HStack {
                                    Label("방 내놓기", systemImage: "house")
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            .padding(.vertical)
                            
                            // 허위매물 신고 내역 버튼
                            NavigationLink(destination: ReportView()) {
                                HStack {
                                    Label("허위매물 신고 내역", systemImage: "doc.text")
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            .padding(.vertical)
                            
                            // 이벤트 버튼
                            NavigationLink(destination: EventView()) {
                                HStack {
                                    Label("이벤트", systemImage: "star")
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            .padding(.vertical)
                            
                            // 안방 새소식 버튼
                            NavigationLink(destination: NewsView()) {
                                HStack {
                                    Label("안방 새소식", systemImage: "bell.badge")
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            .padding(.vertical)
                        }
                        .font(.title2) // 리스트 항목의 텍스트 크기 설정
                        
                        Divider() // 구분선
                        
                        // 현재 앱 버전 정보
                        HStack {
                            VStack {
                                Text("현재 앱 버전")
                                Spacer()
                                Text("1.0.0")
                            }
                            
                            Spacer()
                            
                            Text("최신 버전입니다.")
                        }
                        .padding(.vertical)
                        
                        Divider() // 구분선
                        
                        // 약관 및 회사 소개
                        NavigationLink(destination: TermsView()) {
                            HStack {
                                Text("이용약관")
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                        }
                        .padding(.vertical)
                        
                        NavigationLink(destination: PrivacyPolicyView()) {
                            HStack {
                                Text("개인정보 처리방침")
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                        }
                        .padding(.vertical)
                        
                        NavigationLink(destination: CompanyInfoView()) {
                            HStack {
                                Text("회사 소개")
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                        }
                        .padding(.vertical)
                    }
                }
                .padding()
            }
            .navigationBarTitle("", displayMode: .inline) // 네비게이션 바 타이틀 설정
        }
    }
}

#Preview {
    MoreView()
}
