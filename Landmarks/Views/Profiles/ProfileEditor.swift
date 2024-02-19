//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by tom montgomery on 2/18/24.
//

import SwiftUI

struct ProfileEditor: View {
    
    @Binding var profile: Profile
    
    // TODO: date range & datepicker tut
    var dateRange: ClosedRange<Date> {
        // Set the min and max for the date picker
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("User Name: ")
                Spacer()
                TextField("username", text: $profile.userName)
                    .foregroundStyle(.secondary)
                // right aligned
                    .multilineTextAlignment(.trailing)
            }
            // Toggle is a built-in HStack
            Toggle(isOn: $profile.prefersNotifications) {
                // trailing closure syntax for label
                Text("Enable Notifications")
            }
            
            Picker("Seasonal Image", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
            }
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date")
                // the dateRange allows more dates to be seen, but bounced back to the range.  wierd UX.  Cal selector is cool though.
            }
        }
    }
}

#Preview {
    // swift knows to look for static props with .constant of the required type
    ProfileEditor(profile: (.constant(.default)))
}
