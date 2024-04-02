//
//  LandmarkDetail.swift
//  WatchLandmarks Watch App
//
//  Created by tom montgomery on 3/6/24.
//

import SwiftUI

struct LandmarkDetail: View {
    // TODO: we have access even
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        // TODO: why do we bind here?
        @Bindable var modelData = modelData
        
        ScrollView {
            // Scrollview fixes the ability to see all the elements but breaks our .scaledtoFill on the image.  gotta use Fit instead of Fill and padding
            VStack {
                // since we made it resizable, scaled to fill works nicely
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)
                Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite) {
                    Text("Favorite")
                }
                Divider()
                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                Text(landmark.state)
                    .font(.caption)
                Divider()
                MapView(coordinate: landmark.locationCoordinate)
                    .scaledToFit()
                // scaled to fit to get a nice square
            }
            .padding(16)
            // a little bonus padding so we can see a bit of the name (pre-scroll)
        }
        .navigationTitle("Landmarks")
    }
}

#Preview {
    // create an instance, pass it in and set the views .environment
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
}
