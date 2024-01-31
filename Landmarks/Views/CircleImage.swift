//
//  CircleImage.swift
//  Landmarks
//
//  Created by tom montgomery on 1/21/24.
//

import SwiftUI

struct CircleImage: View {
    
    // pass in image from json data
    var image: Image
    
    var body: some View {
        image
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        // before the stroke defaults to black fill
            .overlay {
                // white border makes it pop with the shadow
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("turtlerock"))
}
