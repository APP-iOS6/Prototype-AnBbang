//
//  RoundedRectangleWithShadowBackground.swift
//  AnBbang
//
//  Created by Jaemin Hong on 9/24/24.
// 

import SwiftUI

struct RoundedRectangleWithShadowBackground<Content>: View where Content: View {
    var cornerRadius: CGFloat = 5
    var shadowRadius: CGFloat = 1.5
    var frame: CGSize = CGSize(width: 50, height: 50)
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundStyle(.white)
                .shadow(radius: shadowRadius)
                .frame(width: frame.width, height: frame.height)
            
            content()
        }
    }
}

#Preview {
    RoundedRectangleWithShadowBackground() {
        Text("RoundedRectangle")
    }
}
