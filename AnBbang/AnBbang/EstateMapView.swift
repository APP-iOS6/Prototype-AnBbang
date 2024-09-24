//
//  EstateMapView.swift
//  DummyProject
//
//  Created by Jaemin Hong on 9/24/24.
//

import SwiftUI
import Observation

struct EstateMapView: View {
    @Bindable var residenceStore: ResidenceStore
    @State private var currScale: CGFloat = 0.0
    @State private var scale: CGFloat = 1.0
    @State private var shouldShowHomeList: Bool = true
    @State private var showFilterSheet: Bool = false
    @State private var searchText: String = ""
    @State private var mapFilterSheetTitle: String = ""
    @State private var currMap: ImageResource = .MapDummy._22PoliceStay
    @State private var stayNumberMap: ImageResource? = .MapDummy.stayNumber
    @State private var filterSheetType: FilterSheetType = .protection
    var category: String = ""
    var categoryImage: String = ""
    
    private var magnification: some Gesture {
        MagnifyGesture()
            .onChanged { value in
                currScale = value.magnification - 1
            }
            .onEnded { value in
                scale += currScale
                
                if scale < 0.5 {
                    scale = 0.5
                } else if scale > 1.0 {
                    scale = 1.0
                }
                
                currScale = 0
            }
    } // 실기기에서 버그는 있지만 기능은 잘 작동함
    
    var body: some View {
        ZStack(alignment: .top) {
            GeometryReader { geometry in
                ScrollView([.vertical, .horizontal]) {
                    ZStack {
                        Image(currMap)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(currScale + scale)
                            .gesture(magnification)
                        if let stayNumberMap {
                            Image(stayNumberMap)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(currScale + scale)
                                .gesture(magnification)
                        }
                    }
                    .frame(
                        width: max(UIImage(resource: currMap).size.width * (currScale + scale), geometry.size.width),
                        height: max(UIImage(resource: currMap).size.height * (currScale + scale), geometry.size.height))
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            
            VStack(alignment: .trailing, spacing: 10) {
                SearchView(searchText: $searchText, category: category, categoryImage: categoryImage)
                    .padding(.top, 100)
                
                HStack(spacing: 10) {
                    RoundedRectangleWithShadowBackground(cornerRadius: 30, frame: CGSize(width: 50, height: 30)) {
                        Button {
                            //scale += 0.1
                        } label: {
                            Image(systemName: "switch.2")
                        }
                    }
                    
                    RoundedRectangleWithShadowBackground(cornerRadius: 30, frame: CGSize(width: 120, height: 30)) {
                        Button {
                            //scale -= 0.1
                        } label: {
                            Text("거래유형/가격")
                        }
                    }
                    
                    RoundedRectangleWithShadowBackground(cornerRadius: 30, frame: CGSize(width: 85, height: 30)) {
                        Button {
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
            NavigationStack {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(residenceStore.residences.indices) { index in
                            ResidenceDetail(residence: $residenceStore.residences[index], isVertical: true)
                                .presentationDetents([.fraction(0.1), .fraction(0.4), .fraction(0.8) ])
                                .presentationBackgroundInteraction(.enabled)
                                .interactiveDismissDisabled()
                        }
                    }
                }
                .padding(.leading, 20)
            }
        }
        .ignoresSafeArea()
        .modifier(BackButtonModifier())
    }
}

#Preview {
    MainView()
        .environment(ResidenceStore())
}
