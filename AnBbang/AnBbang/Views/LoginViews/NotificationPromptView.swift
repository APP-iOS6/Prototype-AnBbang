//
//  NotificationPromptView.swift
//  AnBbang_Practice
//
//  Created by seungcheol on 9/24/24.
//

import SwiftUI

struct NotificationPromptView: View {
    @Bindable var localNotificationManager: LocalNotificationManager = LocalNotificationManager.shared
    @State private var showAlert = false
    @State private var navigateToMain = false
    
    var body: some View {
        VStack {
            Spacer()
            
            if(!localNotificationManager.isSetNotificationAuth) {
                // 알림 설정 메시지
                VStack {
                    Text("알림을 받으시면 좋아요")
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
            }
            
            // NavigationLink로 MainView 이동 제어
            NavigationLink(destination: MainView(), isActive: $localNotificationManager.isSetNotificationAuth) {
                EmptyView()
            }
        }
        .onAppear {
            localNotificationManager.requestPermission()
        }
    }
}

#Preview {
    NotificationPromptView()
}
