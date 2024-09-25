//
//  RoomReviewView.swift
//  AnBbang
//
//  Created by Hwang_Inyoung on 9/24/24.
//

import SwiftUI

struct RoomReviewView: View {
    @EnvironmentObject var reviewStore: RoomReviewStore // Store 인스턴스 생성
    @Binding var residence: ResidenceInfo
    // 예시 방 정보
    var roomName: String = "서울 강남 원룸"
    var roomImage: String = "house"
    
    var body: some View {
        VStack {
            // 방 정보 섹션
            VStack(alignment: .center, spacing: 10) {
                RoomImagesView(roomImages: residence.images)
                
                Text(residence.subInfo)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(residence.quickInfo.address)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Divider()
            
            // 리뷰 목록
            ScrollView {
                VStack {
                    ForEach(reviewStore.reviews) { review in
                        HStack(alignment: .top) {
                            Image(systemName: review.userImage)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .padding(.trailing, 10)
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(review.userName)
                                        .font(.headline)
                                    Spacer()
                                    Text(review.reviewDate)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                
                                Text(review.reviewText)
                                    .font(.body)
                                    .padding(.top, 5)
                                
                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(review.roomImages, id: \.self) { image in
                                            Image(image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 80, height: 80)
                                        }
                                    }
                                }
                                
                                HStack {
                                    ForEach(0..<5) { star in
                                        Image(systemName: star < review.rating ? "star.fill" : "star")
                                            .foregroundColor(star < review.rating ? .yellow : .gray)
                                    }
                                }
                                .padding(.top, 5)
                            }
                        }
                        .padding(.vertical, 10)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        
                        Divider()
                    }
                    
                }
            }
           
            
//            List(reviewStore.reviews) { review in
//                HStack(alignment: .top) {
//                    Image(systemName: review.userImage)
//                        .resizable()
//                        .frame(width: 50, height: 50)
//                        .clipShape(Circle())
//                        .padding(.trailing, 10)
//                    
//                    VStack(alignment: .leading) {
//                        HStack {
//                            Text(review.userName)
//                                .font(.headline)
//                            Spacer()
//                            Text(review.reviewDate)
//                                .font(.subheadline)
//                                .foregroundColor(.gray)
//                        }
//                        
//                        Text(review.reviewText)
//                            .font(.body)
//                            .padding(.top, 5)
//                        
//                        HStack {
//                            ForEach(0..<5) { star in
//                                Image(systemName: star < review.rating ? "star.fill" : "star")
//                                    .foregroundColor(star < review.rating ? .yellow : .gray)
//                            }
//                        }
//                        .padding(.top, 5)
//                    }
//                }
//                .padding(.vertical, 10)
//            }
//            .listStyle(.plain)
        }
        .navigationTitle("방 리뷰")
        .modifier(BackButtonModifier())
    }
}

#Preview {
    MainView()
        .environment(ResidenceStore())
        .environment(RoomReviewStore())
}
