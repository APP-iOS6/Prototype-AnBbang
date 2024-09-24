//
//  RoomReviewStore.swift
//  AnBbang
//
//  Created by Hwang_Inyoung on 9/24/24.
//

import SwiftUI
import Combine

// 리뷰 데이터를 관리하는 Store 클래스
class RoomReviewStore: ObservableObject {
    @Published var reviews: [RoomReview] = [
        RoomReview(userName: "홍길동", userImage: "person.circle", reviewText: "방이 정말 깔끔하고 위치가 좋습니다.", reviewDate: "2024.09.24", rating: 5),
        RoomReview(userName: "김철수", userImage: "person.circle.fill", reviewText: "조용하고 깨끗하지만 가격이 조금 비싸네요.", reviewDate: "2024.09.23", rating: 4),
        RoomReview(userName: "이영희", userImage: "person.circle", reviewText: "사진과 달라서 실망했어요.", reviewDate: "2024.09.22", rating: 2)
    ]
    
    // 리뷰 추가 메서드
    func addReview(userName: String, userImage: String, reviewText: String, reviewDate: String, rating: Int) {
        let newReview = RoomReview(userName: userName, userImage: userImage, reviewText: reviewText, reviewDate: reviewDate, rating: rating)
        reviews.append(newReview)
    }
}

struct RoomReview: Identifiable {
    var id = UUID()
    var userName: String
    var userImage: String
    var reviewText: String
    var reviewDate: String
    var rating: Int
}
