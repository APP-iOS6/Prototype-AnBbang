//
//  ResidenceDetail.swift
//  AnBbang
//
//  Created by Hyunwoo Shin on 9/25/24.
//

import SwiftUI

struct ResidenceDetail: View {
    @EnvironmentObject var residenceStore: ResidenceStore
    @Binding var residence: ResidenceInfo
    @State var isVertical: Bool = false
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationLink {
            ResidenceInfoView(residence: $residence, isSheet: false)
        } label: {
            if isVertical {
                VStack {
                    ResidenceDetailContent(residence: $residence, isVertsical: $isVertical)
                }
            } else {
                HStack {
                    ResidenceDetailContent(residence: $residence, isVertsical: $isVertical)
                        .padding(.leading, 20)
                    Spacer()
                }
            }
        }
    }
}

//#Preview {
//    ResidenceDetail()
//}
