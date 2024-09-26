//
//  BackButtonModifier.swift
//  AnBbang
//
//  Created by Hyunwoo Shin on 9/25/24.
//

import SwiftUI

struct BackButtonModifier: ViewModifier {
    @Environment(\.dismiss) var dismiss
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden() // 기존의 back button 숨김 처리
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button { // 새로운 back button 설정
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .fontWeight(.bold)
                            .foregroundStyle(Color(UIColor.label))
                    }
                }
            }
    }
}
