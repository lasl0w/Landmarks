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
            // TODO: why don't i have to pass landmarks in?
            // don't need "id: \.id" if it's Identifiable
            List(landmarks) { landmark in
               
                NavigationLink {
                    // destination:  the view when clicked
                    LandmarkDetail(landmark: landmark)
                } label: {
                    // The left nav (on ipad) or the initial view
                    LandmarkRow(landmark: landmark)
                }

            }
            .navigationTitle("Landmarks")
        } detail: {
            // the view on ipad BEFORE a NavLink is clicked again
            Text("Select a landmark")
        }
    }
    
}

#Preview {
    LandmarkList()
}
