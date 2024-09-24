//
//  EstateMapView.swift
//  DummyProject
//
//  Created by Jaemin Hong on 9/24/24.
//

import SwiftUI

struct EstateMapView: View {
    @State private var scale: CGFloat = 1.0
    @State private var shouldShowHomeList: Bool = false
    @State private var searchText: String = ""
    
    private var magnification: some Gesture {
        MagnifyGesture()
            .onChanged { value in
                scale = value.magnification
            }
    } // 실기기에서 버그는 있지만 기능은 잘 작동함
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView([.vertical, .horizontal]) {
                Image(.MapDummy.map)
                    .scaleEffect(scale)
                    .gesture(magnification)
            }
            .sheet(isPresented: $shouldShowHomeList) {
                ForEach(1...10, id: \.self) { num in
                    Text("\(num)")
                }
                .presentationDragIndicator(.visible)
                .presentationDetents([.fraction(0.1), .fraction(0.45), .fraction(0.65)])
                .presentationBackgroundInteraction(.enabled)
                .onDisappear() {
                    //houldShowHomeList = true
                }
            }
            
            VStack(alignment: .trailing, spacing: 10) {
                SearchView(searchText: $searchText)
                
                HStack(spacing: 10) {
                    RoundedRectangleWithShadowBackground(cornerRadius: 30, frame: CGSize(width: 50, height: 30)) {
                        Button {
                            print("A")
                        } label: {
                            Image(systemName: "switch.2")
                        }
                    }
                    
                    RoundedRectangleWithShadowBackground(cornerRadius: 30, frame: CGSize(width: 120, height: 30)) {
                        Button {
                            print("B")
                        } label: {
                            Text("거래유형/가격")
                        }
                    }
                    
                    RoundedRectangleWithShadowBackground(cornerRadius: 30, frame: CGSize(width: 85, height: 30)) {
                        Button {
                            print("C")
                        } label: {
                            Text("방크기")
                        }
                    }
                }
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 5.5)
                
                VStack() {
                    RoundedRectangleWithShadowBackground(frame: CGSize(width: 50, height: 145)) {
                        VStack(alignment: .center, spacing: 10) {
                            Text("도구")
                            Divider()
                                .frame(width: 50)
                            Text("시세")
                            Divider()
                                .frame(width: 50)
                            Text("숨김")
                        }
                    }
                    
                    RoundedRectangleWithShadowBackground {
                        Image(systemName: "dot.scope")
                            .font(.title2)
                    }
                }
                .padding(.trailing, 10)
            }
        }
    }
}

//#Preview {
//    EstateMapView()
//}
