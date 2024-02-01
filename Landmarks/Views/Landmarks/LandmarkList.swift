//
//  LandmarkList.swift
//  Landmarks
//
//  Created by tom montgomery on 1/25/24.
//

import SwiftUI

struct LandmarkList: View {
    // TODO: new syntax with the use of .self with the EO?  purpose?  why not do it like the preview
    @Environment(ModelData.self) var modelData
    // showFavs toggle.  default to false.  b/c state is specific to views & sub-views, always make private
    @State private var showFavoritesOnly = false
    
    // filtered version of the landmarks array
    var filteredLandmarks: [Landmark] {
        // is landmarks just here b/c I created it as a model?  No EO
        modelData.landmarks.filter { landmark in
            // if showFavOnly is false OR landmark isFav, add them to the filteredLandmarks
            (!showFavoritesOnly || landmark.isFavorite)
            // if showFavs is true, don't add the ones that are not isFav
        }
    }
    
    var body: some View {
        // SplitView renders a 2-column layout on ipad, left nav / drawer
        NavigationSplitView {
            // TODO: why don't i have to pass landmarks in?
            // don't need "id: \.id" if it's Identifiable
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                // when combining static and dynamic views, use a ForEach instead of passing the collection into a List
                ForEach(filteredLandmarks) { landmark in
                    
                    NavigationLink {
                        // destination:  the view when clicked
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        // The left nav (on ipad) or the initial view
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            // the view on ipad BEFORE a NavLink is clicked again
            Text("Select a landmark")
        }
    }
    
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
