//
//  ResidenceInfo.swift
//  AnBbang
//
//  Created by Hyunwoo Shin on 9/24/24.
//

import Foundation

struct ResidenceInfo: Identifiable {
    var id: UUID = .init()
    var images: [String]
    var residenceType: String
    var isFavorite: Bool = false
    var isFemaleOnly: Bool = false
    var subInfo: String
    var registNumber: String
    var registDate: String
    var realEstateAgent: RealEstateAgent
    var quickInfo: QuickInfo
    var maintenanceCost: MaintenanceCost
    var options: [Option]
    var roomDescription: String
}

struct RealEstateAgent {
    var name: String
    var rating: Double
}

struct QuickInfo {
    var adress: String
    var monthlyRent: String
    var maintenanceCost: String
}

struct DetailInfo {
    
}

struct MaintenanceCost {
    var cost: String
    var detail: String
}

struct Option: Identifiable {
    var id: UUID = .init()
    var name: String
    var image: String
}
