//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by tom montgomery on 2/2/24.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        
        // embed in geometry reader so the badge can use the size (height/width) of the containing view
        GeometryReader { geo in
            // use paths to combine lines, curves and other drawing primitives
            Path { path in
                
                // use the min of width or height in case the containing view is not square
                var width: CGFloat = min(geo.size.width, geo.size.height)
                //var width: CGFloat = 100.0
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                // effectively give it some padding
                width *= xScale
                // add starting point - imaginary pencil moving to a point!
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                
                //
                HexagonParameters.segments.forEach { segment in
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    
                    // add Bezier curves
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )
                }

                
            }
            .fill(.linearGradient(Gradient(colors: [Self.gradientStart, Self.gradientEnd]), startPoint: UnitPoint(x: 0.5, y: 0),
                                  endPoint: UnitPoint(x: 0.5, y: 0.6)
                                 ))
        }
        // move the whole thing to the middle - 1:1 aspect ratio to maintain position
        .aspectRatio(1, contentMode: .fit)
    }
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

#Preview {
    BadgeBackground()
}
