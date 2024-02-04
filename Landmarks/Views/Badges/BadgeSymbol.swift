//
//  BadgeSymbol.swift
//  Landmarks
//
//  Created by tom montgomery on 2/2/24.
//

import SwiftUI

struct BadgeSymbol: View {
    
    // must be static in order to use it with Self.
    static let symbolColor = Color(red: 79.0 / 255, green: 70.0 / 255, blue: 191.0 / 255)
    
    var body: some View {
        

        
        GeometryReader { geo in
            
            Path { path in
                let width = min(geo.size.width, geo.size.height)
                let height = width * 0.75
                let spacing = width * 0.030
                let middle = width * 0.5
                let topWidth = width * 0.226
                let topHeight = height * 0.488
                
                // add 3 CGPoints before you see a shape filled in
                path.addLines([
                CGPoint(x: middle, y: spacing),
                CGPoint(x: middle - topWidth, y: topHeight - spacing),
                CGPoint(x: middle, y: topHeight / 2 + spacing),
                CGPoint(x: middle + topWidth, y: topHeight - spacing),
                CGPoint(x: middle, y: spacing)
                ])
                
                path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
                path.addLines([
                CGPoint(x: middle - topWidth, y: topHeight + spacing),
                CGPoint(x: spacing, y: height - spacing),
                CGPoint(x: width - spacing, y: height - spacing),
                CGPoint(x: middle + topWidth, y: topHeight + spacing),
                CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
                ])
            }
            .fill(Self.symbolColor)
        }
    }
}

#Preview {
    BadgeSymbol()
}
