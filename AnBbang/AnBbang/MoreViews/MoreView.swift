//
//  MoreView.swift
//  AnBbang
//
//  Created by Hwang_Inyoung on 9/24/24.
//

import SwiftUI

struct MoreView: View {
    @State private var showLogoutAlert = false // 로그아웃 알림 표시 여부
    @State private var isLoggedOut = false // 로그아웃 상태 관리
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // 로그인된 경우, 프로필 아이콘과 로그아웃 버튼 표시
                    HStack {
                        Button(action: {
                            showLogoutAlert = true // 로그아웃 알림 띄우기
                        }) {
                            HStack {
                                Image(systemName: "person.circle") // 프로필 아이콘
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                                Text("구아바") // 로그인된 사용자 닉네임
                                    .font(.title)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                        }
                        .alert(isPresented: $showLogoutAlert) {
                            Alert(
                                title: Text("로그아웃 하시겠습니까?"),
                                primaryButton: .destructive(Text("로그아웃")) {
                                    isLoggedOut = true // 로그아웃 상태로 전환
                                },
                                secondaryButton: .cancel(Text("취소"))
                            )
                        }
                    }
                    .padding(.top)
                    
                    Divider() // 구분선
                    
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
                    
                    Divider() // 구분선
                    
                    // 리스트 항목들 (왼쪽 정렬)
                    VStack(alignment: .leading) {
                        NavigationLink(destination: RoomView()) {
                            HStack {
                                Image(systemName: "house")
                                Text("방 내놓기")
                                    .foregroundStyle(.black)
                                Spacer()
                            }
                        }
                        .padding(.vertical)
                        
                        NavigationLink(destination: ReportView()) {
                            HStack {
                                Image(systemName: "doc.text")
                                Text(" 허위매물 신고 내역")
                                    .foregroundStyle(.black)
                                Spacer()
                            }
                        }
                        .padding(.vertical)
                        
                        NavigationLink(destination: EventView()) {
                            HStack {
                                Image(systemName: "star")
                                Text("이벤트")
                                    .foregroundStyle(.black)
                                Spacer()
                            }
                        }
                        .padding(.vertical)
                        
                        NavigationLink(destination: NewsView()) {
                            HStack {
                                Image(systemName: "bell.badge")
                                Text(" 안방 새소식")
                                    .foregroundStyle(.black)
                                Spacer()
                            }
                        }
                        .padding(.vertical)
                        
                        Divider()
                        
                        // 현재 앱 버전 정보
                        HStack {
                            VStack(alignment: .leading) {
                                Text("현재 앱 버전")
                                Spacer()
                                Text("1.0.0")
                            }
                            
                            Spacer()
                            
                            Text("최신 버전입니다.")
                        }
                        .padding(.vertical)
                        
                        Divider()
                        
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
                
                // 로그아웃 시 LoginView로 이동
                NavigationLink(destination: LoginView(), isActive: $isLoggedOut) {
                    EmptyView() // 빈 뷰
                }
            }
            .navigationBarTitle("", displayMode: .inline) // 네비게이션 바 타이틀 설정
        }
    }
}

#Preview {
    MoreView()
}

