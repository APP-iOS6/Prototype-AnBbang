//
//  LoginView.swift
//  AnBbang
//
//  Created by seungcheol on 9/24/24.
//

import SwiftUI


struct LoginView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // 안방 로고 이미지
                Image("anbbangLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 330, height: 150) // 로고 사이즈
                
                Spacer()
                    .frame(height: 20)
                
                
                VStack {
                    Text("간편하게 로그인하고")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.gray)
                    
                    Text("다양한 서비스를 이용하세요.")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.black)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 30)
                
                // 카카오 로그인 버튼
                NavigationLink(destination: MainView()) {
                    HStack {
                        Image("kakaoLogo")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("카카오톡으로 시작")
                            .font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(8)
                    .background(Color.yellow)
                    .foregroundColor(.black)
                    .cornerRadius(100)
                }
                .frame(height: 50)
                .padding(.horizontal, 30)
                
                // Google 로그인 버튼
                NavigationLink(destination: MainView()) {
                    HStack {
                        Image("googleLogo")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("Google로 시작")
                            .font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(8)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
                .frame(height: 50)
                .padding(.horizontal, 30)
                
                
                // Apple 로그인 버튼
                Button(action: {
                    
                }) {
                    HStack {
                        Image(systemName: "applelogo")
                            .resizable()
                            .frame(width: 20, height: 24)
                        Text("Apple로 등록")
                            .font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(8)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(100)
                }
                .frame(height: 50)
                .padding(.horizontal, 30)
                
                
                // Facebook 로그인 버튼
                NavigationLink(destination: MainView()) {
                    HStack {
                        Image("facebookLogo")
                            .resizable()
                            .frame(width: 35, height: 24)
                        Text("Facebook으로 시작")
                            .font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(8)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
                .frame(height: 50)
                .padding(.horizontal, 30)
                
                
                Spacer()
                
                // 이메일로 로그인 링크
                NavigationLink(destination: MainView()) {
                    Text("이메일로 로그인하기")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .padding(.bottom, 20)
                }
            }
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
}


#Preview {
    LoginView()
}

