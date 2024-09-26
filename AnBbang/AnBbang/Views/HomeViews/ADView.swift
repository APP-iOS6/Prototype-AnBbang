//
//  ADView.swift
//  AnBbang
//
//  Created by Hyunwoo Shin on 9/25/24.
//

import SwiftUI

struct ADView: View {
    @State private var currentIndex = 0
    private let imageNames = ["SafeHomeService", "SafeDeliveryService", "SafeStayService", "SafetyWhistle2", "ElectricShocker"]
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(0..<imageNames.count, id: \.self) { index in
                Image(imageNames[index])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .onReceive(timer) { _ in
            withAnimation {
                currentIndex = currentIndex < imageNames.count - 1 ? currentIndex + 1 : 0
            }
        }
    }
}

#Preview {
    ADView()
}
