//
//  ResidenceDetailContent.swift
//  AnBbang
//
//  Created by Hyunwoo Shin on 9/25/24.
//

import SwiftUI

struct ResidenceDetailContent: View {
    @EnvironmentObject var residenceStore: ResidenceStore
    @Binding var residence: ResidenceInfo
    @State private var heartImageName: String = "suit.heart"
    @Binding var isVertsical: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(residence.images[0])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(alignment: .leading)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            Button {
                residenceStore.toggleFavorite(id: residence.id)
            } label: {
                Image(systemName: residence.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(residence.isFavorite ? .red : .white)
            }
            .padding(.top, 5)
            .padding(.trailing, 5)
            .zIndex(1)
        }
        .frame(width: 130, height: 130, alignment: .leading)
        
        if isVertsical {
            VStack(alignment: .leading, spacing: 10) {
                Text(residence.quickInfo.monthlyRent)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(residence.residenceType)
                    .font(.caption)
                Text(residence.subInfo)
                    .font(.caption)
            }
            .foregroundStyle(Color(UIColor.label))
            .frame(width: 130, height: 100, alignment: .leading)
        } else {
            VStack(alignment: .leading, spacing: 15) {
                Text(residence.quickInfo.monthlyRent)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(residence.residenceType)
                    .font(.caption)
                Text(residence.subInfo)
                    .font(.caption)
                
                Spacer()
            }
            .foregroundStyle(Color(UIColor.label))
            .frame(width: 200, height: 130, alignment: .leading)
            .padding(.leading, -10)
        }
    }
}

//#Preview {
//    ResidenceDetailContent()
//}
