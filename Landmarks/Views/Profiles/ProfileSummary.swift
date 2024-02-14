//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by tom montgomery on 2/13/24.
//

import SwiftUI

struct ProfileSummary: View {
    // takes a value instead of a binding b/c the parent (ProfileHost) manages the state for this little guy
    var profile: Profile
    
    // get that ModelData in here for hike data
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.userName)
                    .bold()
                    .font(.title)
                // sweet ternary
                Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
                // pass the rawValue to get the emoji
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                // some simple date formatting.  special func for dates in the Text() class yay!
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(/*@START_MENU_TOKEN@*/0.50/*@END_MENU_TOKEN@*/)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    HikeView(hike: modelData.hikes[0])
                    // to use the Hike data, we have to add the ModelData EO
                }
            }
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default)
        .environment(ModelData())
}
