//
//  EstateMapView.swift
//  DummyProject
//
//  Created by Jaemin Hong on 9/24/24.
//

import SwiftUI
import Observation

struct EstateMapView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var residenceStore: ResidenceStore
    @State private var currScale: CGFloat = 0.0
    @State private var scale: CGFloat = 1.0
    @State private var shouldShowHomeList: Bool = false
    @State private var shouldShowHomeDetail: Bool = false
    @State private var showFilterSheet: Bool = false
    @State private var searchText: String = ""
    @State private var mapFilterSheetTitle: String = ""
    @State private var currMap: ImageResource = .MapDummy.defaultMap
    @State private var stayNumberMap: ImageResource? = .MapDummy.stayNumber
    @State private var filterSheetType: FilterSheetType = .protection
    @State private var selectedFilter: Int = 0
    @State private var showFullScreen: Bool = false
    var category: String = ""
    var categoryImage: String = ""
    @State private var selectedResidence: ResidenceInfo = ResidenceInfo(
        images: ["TempRoom3", "TempRoom", "TempRoom2"],
        residenceType: "원룸",
        isFavorite: false,
        isFemaleOnly: true,
        subInfo: "3층/4층, 30.15m², 관리비 17만원",
        registNumber: "98765432",
        registDate: "2024-09-24",
        realEstateAgent: RealEstateAgent(
            name: "LAB 5 공인중개사사무소",
            rating: 4.9),
        quickInfo: QuickInfo(
            address: "경상북도 경산시 압량읍",
            monthlyRent: "월세 45/1000",
            maintenanceCost: "관리비 7만원"
        ),
        maintenanceCost: MaintenanceCost(
            cost: "월 관리비 170,000원",
            detail: """
                    최근 1년 관리비 평균금액 기준으로 산정
                    - 부과방식 : 정액관리비
                    - 일반(공용)관리비 : 170,000원
                    - 인터넷 사용료 : 의뢰인 미제공
                    - 수도료: 의뢰인 미제공
                    - TV사용료 : 의뢰인 미제공
                    - 기타관리비 : 의뢰인 미제공
                    """),
        options: [
            Option(name: "세탁기", image: "refrigerator"),
            Option(name: "싱크대", image: "sink"),
            Option(name: "에어컨", image: "air.conditioner.horizontal"),
            Option(name: "신발장", image: "shoe.2"),
            Option(name: "옷장", image: "hanger"),
            Option(name: "침대", image: "bed.double"),
            Option(name: "가스렌지", image: "stove"),
            Option(name: "책상", image: "studentdesk"),
            
        ],
        roomDescription: """
                     방이 깔끔해요!
                     바퀴벌레도 없어요!
                     쥐도 없는것 같아요!
                     햇볕도 끝내줍니다
                     """
    )
    
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
                    .onTapGesture {
                        shouldShowHomeList.toggle()
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            
            VStack(alignment: .trailing, spacing: 10) {
                SearchView(searchText: $searchText, category: category, categoryImage: categoryImage)
                    .padding(.top, screenBounds!.height / 9)
                    .zIndex(1)
                
                HStack(spacing: 10) {
                    RoundedRectangleWithShadowBackground(cornerRadius: 30, frame: CGSize(width: 50, height: 30)) {
                        Button {
                            //scale += 0.1
                        } label: {
                            Image(systemName: "switch.2")
                        }
                    }
                    .padding(.leading, 15)
                    
                    RoundedRectangleWithShadowBackground(cornerRadius: 30, frame: CGSize(width: 85, height: 30)) {
                        Button {
                            //scale -= 0.1
                        } label: {
                            Text("가격대")
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
                .padding(.trailing, 15)
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
                    Button("안심택배") {
                        currMap = .MapDummy._44DeliveryService
                        showFilterSheet.toggle()
                    }
                    Button("빨래방") {
                        currMap = .MapDummy._43Wash
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
        .fullScreenCover(isPresented: $shouldShowHomeDetail) {
            VStack {
                ResidenceInfoView(residence: $selectedResidence, isSheet: true)
            }
        }
        .sheet(isPresented: $shouldShowHomeList) {
            HStack {
                Spacer()
                
                Picker("filter", selection: $selectedFilter) {
                    Text("가격 순")
                        .tag(0)
                        .foregroundStyle(Color(UIColor.label))
                    Text("여성 전용")
                        .tag(1)
                        .foregroundStyle(Color(UIColor.label))
                }
                .pickerStyle(.menu)
                .tint(Color(UIColor.label))
                
                HStack(spacing: 0) {
                    Button {
                        showFullScreen.toggle()
                    } label: {
                        Text("더보기 ")
                            .foregroundStyle(Color(UIColor.label))
                    }
                    
                    Image(systemName: "chevron.forward")
                        .foregroundStyle(Color(UIColor.label))
                        .padding(.trailing, 10)
                }
            }
            .padding(.top, 10)
            
            NavigationStack {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(residenceStore.residences.indices) { index in
                            Button {
                                selectedResidence = residenceStore.residences[index]
                                shouldShowHomeDetail.toggle()
                            } label: {
                                ResidenceDetail(residence: $residenceStore.residences[index], isVertical: true)
                            }
                            
                        }
                    }
                }
            }
            .padding(.leading, 10)
            .presentationDetents([.fraction(0.5)])
//            .presentationBackgroundInteraction(.enabled(upThrough: .fraction(0.4)))
            .fullScreenCover(isPresented: $showFullScreen) {
                NavigationStack {
                    MoreRoomsView()
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden() // 기존의 back button 숨김 처리
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button { // 새로운 back button 설정
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    //EstateMapView(residenceStore: ResidenceStore())
    MainView()
        .environment(ResidenceStore())
        .environment(RoomReviewStore())
}
