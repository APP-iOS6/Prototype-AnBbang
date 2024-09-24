//
//  RoomReviewView.swift
//  AnBbang
//
//  Created by Hwang_Inyoung on 9/24/24.
//

import SwiftUI

struct RoomReviewView: View {
    @ObservedObject var reviewStore = RoomReviewStore() // Store 인스턴스 생성
    
    // 예시 방 정보
    var roomName: String = "서울 강남 원룸"
    var roomImage: String = "house"
    
    var body: some View {
        NavigationView {
            VStack {
                // 방 정보 섹션
                VStack(alignment: .leading, spacing: 10) {
                    Image(systemName: roomImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Text(roomName)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("강남구, 서울")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                
                Divider()
                
                // 리뷰 목록
                List(reviewStore.reviews) { review in
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
                }
                .listStyle(.inset)
            }
            .navigationTitle("방 리뷰")
        }
    }
}

#Preview {
    RoomReviewView()
}
