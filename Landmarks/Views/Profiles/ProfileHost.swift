//
//  ProfileHost.swift
//  Landmarks
//
//  Created by tom montgomery on 2/13/24.
//

import SwiftUI

// will host both a static view and an edit mode
struct ProfileHost: View {
    
    //TODO: .editMode built in @EO object.  what else is there?
    // allows read/write in the edit scope
    @Environment(\.editMode) var editMode
    // note the edit view operates on a copy of itself until it commits the changes
    // read the users profile data from the environment
    @Environment(ModelData.self) var modelData
    // leverage the static var from the Profile model.  a placeholder.
    @State private var draftProfile = Profile.default
    
    
    var body: some View {
        //Text("Profile for: \(draftProfile.userName)")
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                // convenience button automatically available with the .editMode object
                EditButton()
            }
            //ProfileSummary(profile: draftProfile)
            
            if editMode?.wrappedValue == .inactive {
                // we're not in editMode!
                ProfileSummary(profile: modelData.profile)
            } else {
                Text("Edit Placeholder")
            }

        }
        .padding()
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
    // even though this view does not use it, child views do so gotta add it, pass it down
}
