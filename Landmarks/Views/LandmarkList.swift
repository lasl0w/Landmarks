//
//  LandmarkList.swift
//  Landmarks
//
//  Created by tom montgomery on 1/25/24.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
// SplitView renders a 2-column layout on ipad, left nav / drawer
        NavigationSplitView {
            // don't need "id: \.id" if it's Identifiable
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail()
                } label: {
                    LandmarkRow(landmark: landmark)
                }

            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a landmark")
        }
    }
    
}

#Preview {
    LandmarkList()
}
