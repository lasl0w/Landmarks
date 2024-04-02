//
//  NotificationsView.swift
//  WatchLandmarks Watch App
//
//  Created by tom montgomery on 3/13/24.
//

import SwiftUI

struct NotificationsView: View {
    // It's nice to keep the same name as the iOS landmarks app (ContentView).  Makes it easy to share files between targets.
    
    var title: String?
    var message: String?
    var landmark: Landmark?
    
    var body: some View {
        
        if let landmark {
            CircleImage(image: landmark.image.resizable())
                .scaledToFit()
        }
        
        Text(title ?? "Unknown Landmark")
        Divider()
        
        Text(message ?? "You are within 5 miles of one of your fav landmarks")
            .font(.caption)
    }
}

#Preview {
    // Make a preview that pretends we just got a sweet notification
    NotificationsView(title: "Turtle Rock", message: "You are within 5 miles of Turtle Rock", landmark: ModelData().landmarks[0])
}
