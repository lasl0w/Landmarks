//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by tom montgomery on 1/23/24.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
        }

    }
}

#Preview("Turtle Rock") {
    Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}

// Adding a 2nd preview to toggle between
//#Preview ("Salmon"){
//    LandmarkRow(landmark: landmarks[1])
//}
