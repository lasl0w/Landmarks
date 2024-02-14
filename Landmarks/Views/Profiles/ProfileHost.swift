//
//  ProfileHost.swift
//  Landmarks
//
//  Created by tom montgomery on 2/13/24.
//

import SwiftUI

// will host both a static view and an edit mode
struct ProfileHost: View {
    
    // leverage the static var from the Profile model.  a placeholder.
    @State private var draftProfile = Profile.default
    
    
    var body: some View {
        //Text("Profile for: \(draftProfile.userName)")
        VStack(alignment: .leading, spacing: 20) {
            ProfileSummary(profile: draftProfile)
        }
        .padding()
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
    // even though this view does not use it, child views do so gotta add it, pass it down
}
