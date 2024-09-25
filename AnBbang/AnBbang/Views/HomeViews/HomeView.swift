//
//  HomeView.swift
//  AnBbang
//
//  Created by Hyunwoo Shin on 9/25/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var residenceStore: ResidenceStore
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image("anbbangLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 360, height: 70, alignment: .leading)
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Grid {
                        GridRow {
                            NavigationLink {
                                EstateMapView(residenceStore: residenceStore, category: "고시텔", categoryImage: "bed.double.fill")
                            } label: {
                                ResidenceCell(residence: Residence.gositel.rawValue, image: "bed.double.fill")
                            }
                            
                            NavigationLink {
                                EstateMapView(residenceStore: residenceStore, category: Residence.oneRoom.rawValue, categoryImage: "house.fill")
                            } label: {
                                ResidenceCell(residence: Residence.oneRoom.rawValue, image: "house.fill")
                            }
                        }
                        .padding(.bottom, 7)
                        
                        GridRow {
                            NavigationLink {
                                EstateMapView(residenceStore: residenceStore, category: Residence.villaAndTwoRoom.rawValue, categoryImage: "building.2.fill")
                            } label: {
                                ResidenceCell(residence: Residence.villaAndTwoRoom.rawValue, image: "building.2.fill")
                            }
                            
                            NavigationLink {
                                EstateMapView(residenceStore: residenceStore, category: Residence.officetel.rawValue, categoryImage: "building.columns.fill")
                            } label: {
                                ResidenceCell(residence: Residence.officetel.rawValue, image: "building.columns.fill")
                            }
                        }
                    }
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Image("event")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 365)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    Spacer()
                        .frame(height: 20)
                    
                    HStack {
                        Text("이 근처 추천 매물")
                            .frame(width: 310, alignment: .leading)
                            .fontWeight(.bold)
                        
                        NavigationLink {
                            MoreRoomsView()
                        } label: {
                            Text("더보기 ＞")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(residenceStore.residences.indices) { index in
                                ResidenceDetail(residence: $residenceStore.residences[index], isVertical: true)
                            }
                        }
                    }
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
            }
        }
    }
}

#Preview {
    MainView()
        .environment(ResidenceStore())
        .environment(RoomReviewStore())
}
