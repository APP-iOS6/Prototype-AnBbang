//
//  EstateMapView.swift
//  DummyProject
//
//  Created by Jaemin Hong on 9/24/24.
//

import SwiftUI

struct EstateMapView: View {
    @State private var currScale: CGFloat = 0.0
    @State private var scale: CGFloat = 0.4
    @State private var shouldShowHomeList: Bool = true
    @State private var showFilterSheet: Bool = false
    @State private var searchText: String = ""
    @State private var mapFilterSheetTitle: String = ""
    @State private var currMap: ImageResource = .MapDummy._22PoliceStay
    @State private var stayNumberMap: ImageResource? = .MapDummy.stayNumber
    @State private var filterSheetType: FilterSheetType = .protection
    
    private var magnification: some Gesture {
        MagnifyGesture()
            .onChanged { value in
                currScale = value.magnification - 1
            }
            .onEnded { value in
                scale += currScale
                currScale = 0
            }
    } // 실기기에서 버그는 있지만 기능은 잘 작동함
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView([.vertical, .horizontal]) {
                ZStack {
                    Image(currMap)
                        .scaleEffect(currScale + scale)
                        .gesture(magnification)
                    if let stayNumberMap {
                        Image(stayNumberMap)
                            .scaleEffect(currScale + scale)
                            .gesture(magnification)
                    }
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
                            Button("안전") {
                                mapFilterSheetTitle = "안전"
                                filterSheetType = .protection
                                showFilterSheet.toggle()
                            }
                            
                            Divider()
                                .frame(width: 50)
                            Button("편의") {
                                mapFilterSheetTitle = "편의"
                                filterSheetType = .convenience
                                showFilterSheet.toggle()
                            }
                            Divider()
                                .frame(width: 50)
                            Button("숨김") {
                                if stayNumberMap != nil {
                                    stayNumberMap = nil
                                } else {
                                    stayNumberMap = .MapDummy.stayNumber
                                }
                            }
                        }
                        .foregroundStyle(.black)
                    }
                    
                    RoundedRectangleWithShadowBackground {
                        Button {
                            print("자기 위치")
                        } label: {
                            Image(systemName: "dot.scope")
                                .font(.title2)
                        }
                    }
                }
                .foregroundStyle(.black)
                .padding(.trailing, 10)
            }
        }
        .sheet(isPresented: $showFilterSheet) {
            MapFilterSheet(title: $mapFilterSheetTitle, filterSheetType: $filterSheetType) { sheetType in
                switch(sheetType) {
                case .protection:
                    Button("보안") {
                        currMap = .MapDummy._21Police
                        showFilterSheet.toggle()
                    }
                     
                    Button("CCTV") {
                        currMap = .MapDummy.CCTV
                        showFilterSheet.toggle()
                    }
                    
                case .convenience:
                    Button("여성 피트니스 센터") {
                        currMap = .MapDummy.womensFitnessCenter
                        showFilterSheet.toggle()
                    }
                    
                    Button("여성병원") {
                        currMap = .MapDummy._41WomensHospital
                        showFilterSheet.toggle()
                    }
                }
            }
            .presentationDetents([.medium])
        }
        .sheet(isPresented: $shouldShowHomeList) {
            LikelistView()
                .presentationDragIndicator(.visible)
                .presentationDetents([.fraction(0.1), .fraction(0.45), .fraction(0.65)])
                .presentationBackgroundInteraction(.enabled)
                .interactiveDismissDisabled()
                
        }
    }
}

#Preview {
    EstateMapView()
}
