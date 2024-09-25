//
//  RoomReview.swift
//  AnBbang
//
//  Created by Hyunwoo Shin on 9/25/24.
//

import Foundation

struct RoomReview: Identifiable {
    var id = UUID()
    var userName: String
    var userImage: String
    var reviewText: String
    var roomImages: [String] = []
    var reviewDate: String
    var rating: Int
}
