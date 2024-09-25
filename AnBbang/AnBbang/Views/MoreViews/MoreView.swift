//
//  MoreView.swift
//  AnBbang
//
//  Created by Hwang_Inyoung on 9/24/24.
//

import SwiftUI
import SafariServices

struct MoreView: View {
    @State private var showLogoutAlert = false // 로그아웃 알림 표시 여부
    @State private var isLoggedOut = false // 로그아웃 상태 관리
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // 로그인된 경우, 프로필 아이콘 표시
                    NavigationLink(destination: MyInfoView()) {
                        HStack {
                            Image(systemName: "person.circle") // 프로필 아이콘
                                .font(.largeTitle)
                                .foregroundColor(.black)
                            Text("선녀의방") // 로그인된 사용자 닉네임
                                .font(.title3)
                                .foregroundColor(.black)
                            
                            Spacer()
                        }
                    }
                    .padding(.top)
                    
                    Divider() // 구분선
                    
                    // 버튼 섹션
                    HStack {
                        NavigationLink(destination: InquiryView()) {
                            VStack {
                                Spacer()
                                
                                Image(systemName: "magnifyingglass.circle")
                                    .font(.largeTitle)
                                
                                Spacer()
                                    .frame(height: 5) // 아이콘과 텍스트 사이 간격 추가
                                
                                Text("문의한 방")
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: MyPostsView()) {
                            VStack {
                                Image(systemName: "sharedwithyou.circle")
                                    .font(.largeTitle)
                                
                                Spacer()
                                    .frame(height: 5) // 아이콘과 텍스트 사이 간격 추가
                                
                                Text("내가 쓴 이야기")
                                    .foregroundColor(.black)
                            }
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: CustomerSupportView()) {
                            VStack {
                                Image(systemName: "info.circle")
                                    .font(.largeTitle)
                                
                                Spacer()
                                    .frame(height: 5) // 아이콘과 텍스트 사이 간격 추가
                                
                                Text("고객센터")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    Divider() // 구분선
                    
                    Spacer()
                    Spacer()
                    
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
                        .padding(.vertical, 3)
                        
                        NavigationLink(destination: ReportView()) {
                            HStack {
                                Image(systemName: "doc.text")
                                Text(" 허위매물 신고 내역")
                                    .foregroundStyle(.black)
                                Spacer()
                            }
                        }
                        .padding(.vertical, 3)
                        
                        NavigationLink(destination: EventView()) {
                            HStack {
                                Image(systemName: "star")
                                Text("이벤트")
                                    .foregroundStyle(.black)
                                Spacer()
                            }
                        }
                        .padding(.vertical, 3)
                        
                        NavigationLink(destination: NewsView()) {
                            HStack {
                                Image(systemName: "bell.badge")
                                Text(" 안방 새소식")
                                    .foregroundStyle(.black)
                                Spacer()
                            }
                        }
                        .padding(.vertical, 3)
                        
                        // Safari 웹브라우저로 직접 연결되는 링크
                        Button(action: {
                            if let url = URL(string: "https://sexoffender.go.kr/m6s7.nsc") {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            HStack {
                                Image(systemName: "safari") // Safari 아이콘
                                Text(" 성범죄자 조회")
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }
                        .padding(.vertical, 3)
                        
                        Spacer()
                        
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
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .padding(.vertical)
                        
                        Divider()
                        
                        // 약관 및 회사 소개
                        VStack {
                            NavigationLink(destination: TermsView()) {
                                HStack {
                                    Text("이용약관")
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                            }
                            .padding(.vertical, 3)
                            
                            NavigationLink(destination: PrivacyPolicyView()) {
                                HStack {
                                    Text("개인정보 처리방침")
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                            }
                            .padding(.vertical, 3)
                            
                            NavigationLink(destination: CompanyInfoView()) {
                                HStack {
                                    Text("회사 소개")
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                            }
                            .padding(.vertical, 3)
                        }
                        .font(.subheadline)
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    // 로그아웃 버튼
                    Button(action: {
                        showLogoutAlert = true
                    }) {
                        Text("로그아웃")
                            .font(.subheadline)
                            .foregroundColor(.red)
                    }
                    .padding(.bottom, 20) // Tab Bar 위에 충분한 공간을 추가
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
