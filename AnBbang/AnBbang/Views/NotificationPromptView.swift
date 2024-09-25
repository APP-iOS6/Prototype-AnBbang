//
//  NotificationPromptView.swift
//  AnBbang_Practice
//
//  Created by seungcheol on 9/24/24.
//

import SwiftUI

struct NotificationPromptView: View {
    @State private var showAlert = false
    @State private var navigateToMain = false
    
    var body: some View {
        VStack {
            Spacer()
            
            // 알림 설정 메시지
            VStack {
                Text("꼭 알림 받으세요")
                    .font(.system(size: 28, weight: .bold))
                    .padding()
                    
                Text(
"""
알림을 허용하시면 
'안방'에서 제공하는 정보를 
가장 먼저 받아보실 수 있습니다
"""
                )
                    .font(.system(size: 18))
                    .padding(.bottom, 210)
                
                VStack {
                    Image("arrow")
                        .resizable()
                        .frame(width: 24, height: 60)
                        .padding(.leading, 130)
                    
                    Text("허용 버튼 누르고 알림 받기")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.gray)
                        .padding(.bottom, 90)
                }
            }
            .multilineTextAlignment(.center)
            
            Spacer()
            
            // NavigationLink로 MainView 이동 제어
            NavigationLink(destination: MainView(), isActive: $navigateToMain) {
                EmptyView()
            }
        }
        .onAppear {
            // 화면에 나타날 때 알림창 자동 표시
            showAlert = true
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("'안방'에서 알림을 보내고자 합니다.'"),
                message: Text("경고, 사운드 및 아이콘 배지가 알림에 포함될 수 있습니다. 설정에서 이를 구성할 수 있습니다."),
                primaryButton: .default(Text("허용"), action: {
                    navigateToMain = true // 허용을 눌러도 MainView로 이동
                }),
                secondaryButton: .cancel(Text("허용 안 함"), action: {
                    navigateToMain = true // 허용 안 함을 눌러도 MainView로 이동
                })
            )
        }
        .modifier(BackButtonModifier())
    }
}

#Preview {
    NotificationPromptView()
}
