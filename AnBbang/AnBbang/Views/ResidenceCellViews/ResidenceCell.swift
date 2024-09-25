//
//  ResidenceCell.swift
//  AnBbang
//
//  Created by Hyunwoo Shin on 9/25/24.
//

import SwiftUI

struct ResidenceCell: View {
    var residence: String
    var image: String
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: image)
                .padding(.top, 20)
                .font(.largeTitle)
                .foregroundStyle(.accent)
            Spacer()
            Text("\(residence)")
                .frame(minWidth: 175, minHeight: 50)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color(UIColor.label))
        }
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(lineWidth: 1)
                .foregroundStyle(.gray)
                .frame(minHeight: 130)
        }
    }
}

#Preview {
    MainView()
        .environment(ResidenceStore())
        .environment(RoomReviewStore())
}
