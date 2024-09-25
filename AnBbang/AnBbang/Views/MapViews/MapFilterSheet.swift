//
//  MapFilterSheet.swift
//  AnBbang
//
//  Created by Jaemin Hong on 9/24/24.
// 

import SwiftUI

enum FilterSheetType {
    case protection
    case convenience
}

struct MapFilterSheet<Content>: View where Content: View {
    @Binding var title: String
    @Binding var filterSheetType: FilterSheetType
    @ViewBuilder var contents: (_ fileterSheetType: FilterSheetType) -> Content
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .padding(15)
            
            List() {
                contents(filterSheetType)
            }
            .tint(.black)
            .listStyle(.plain)
        }
    }
}

#Preview {
    MapFilterSheet(title: .constant("Protect!"), filterSheetType: .constant(FilterSheetType.protection)) { _ in
        Button("!!!") {
            
        }
        
        Button("@@@") {
            
        }
        
        Button("###") {
            
        }
    }
}
