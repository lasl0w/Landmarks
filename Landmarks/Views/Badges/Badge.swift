//
//  Badge.swift
//  Landmarks
//
//  Created by tom montgomery on 2/2/24.
//

import SwiftUI

struct Badge: View {
    
    var badgeSymbols: some View {
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(angle: .degrees(Double(index) / Double(8)) * 360.0)
                
        }
        .opacity(0.5)

    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            // use geoReader to leverage the surrounding geometry to scale down the badge symbol
            GeometryReader { geo in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geo.size.width / 2.0, y: (3.0 / 4.0) * geo.size.height)
            }

        }
        // brings it tightinto the badge background
        .scaledToFit()
        

    }
}

#Preview {
    Badge()
}
