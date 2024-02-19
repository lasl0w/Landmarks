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
    // allows read/write in the edit scope.  storing editMode in the Environment makes it simple for multiple views to update when the user enters and exits edit mode
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
                // might have an editMode, might not
                if editMode?.wrappedValue == .active {
                    // If we are in editMode, add a Cancel button left of the spacer (left aligned)
                    Button("Cancel", role: .cancel) {
                        // if pressed, return our draftProfile edits back to the old profile and send us back to viewMode
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                // convenience button automatically available with the .editMode object
                EditButton()
            }
            //ProfileSummary(profile: draftProfile)
            
            if editMode?.wrappedValue == .inactive {
                // we're not in editMode!
                ProfileSummary(profile: modelData.profile)
            } else {
                // bound so the draftprofile will update the parent view
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        // TODO: isn't this redundant?
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        // user tapped DONE!  odd that we don't just trigger off the Done event
                        // set our edits in the draftProfile (our copy) to the main source profile
                        modelData.profile = draftProfile
                    }
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
