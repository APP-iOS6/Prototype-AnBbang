//
//  EstateMapView.swift
//  DummyProject
//
//  Created by Jaemin Hong on 9/24/24.
//

import SwiftUI

struct EstateMapView: View {
    var body: some View {
        ScrollView([.vertical, .horizontal]) {
            Image(.MapDummy.map)
        }
    }
}

#Preview {
    EstateMapView()
}
