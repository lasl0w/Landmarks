//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by tom montgomery on 1/31/24.
//

import SwiftUI

struct FavoriteButton: View {
    // when we use a binding, changes propogate back to the data source
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            // convienience special Text() consisting of a label + icon
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
            // Accessability:  .iconOnly does just that, but VoiceOver uses label text to improve accessability
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
