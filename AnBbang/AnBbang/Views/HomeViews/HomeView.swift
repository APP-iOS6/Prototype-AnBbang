//
//  HomeView.swift
//  AnBbang
//
//  Created by Hyunwoo Shin on 9/25/24.
//

import SwiftUI

let screenBounds = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.screen.bounds

struct HomeView: View {
    @EnvironmentObject var residenceStore: ResidenceStore
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Image("anbbangLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 70, alignment: .leading)
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Grid {
                        GridRow {
                            NavigationLink {
                                EstateMapView(residenceStore: residenceStore, category: "고시텔", categoryImage: "bed.double.fill")
                            } label: {
                                ResidenceCell(residence: Residence.gositel.rawValue, image: "bed.double.fill")
                            }
                            
                            Spacer()
                            
                            NavigationLink {
                                EstateMapView(residenceStore: residenceStore, category: Residence.oneRoom.rawValue, categoryImage: "house.fill")
                            } label: {
                                ResidenceCell(residence: Residence.oneRoom.rawValue, image: "house.fill")
                            }
                        }
                        .padding(.bottom, 7)
                        
                        Spacer()
                        
                        GridRow {
                            NavigationLink {
                                EstateMapView(residenceStore: residenceStore, category: Residence.villaAndTwoRoom.rawValue, categoryImage: "building.2.fill")
                            } label: {
                                ResidenceCell(residence: Residence.villaAndTwoRoom.rawValue, image: "building.2.fill")
                            }
                            
                            Spacer()
                            
                            NavigationLink {
                                EstateMapView(residenceStore: residenceStore, category: Residence.officetel.rawValue, categoryImage: "building.columns.fill")
                            } label: {
                                ResidenceCell(residence: Residence.officetel.rawValue, image: "building.columns.fill")
                            }
                        }
                    }
                    
                    Spacer()
                        .frame(height: 0)
                    
                    ADView()
                        .frame(height: screenBounds!.height / 4.5)
                    
                    Spacer()
                        .frame(height: 10)
                    
                    HStack {
                        Text("이 근처 추천 매물")
                            .frame(width: 300, alignment: .leading)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        HStack(spacing: 0) {
                            NavigationLink {
                                MoreRoomsView()
                            } label: {
                                Text("더보기 ")
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            
                            Image(systemName: "chevron.forward")
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
                .padding(.leading, 10)
                .padding(.trailing, 10)
            }
        }
        .onAppear {
        }
    }
}

#Preview {
    MainView()
        .environment(ResidenceStore())
        .environment(RoomReviewStore())
}
