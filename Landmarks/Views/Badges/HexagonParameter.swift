//
//  HexagonParameter.swift
//  Landmarks
//
//  Created by tom montgomery on 2/2/24.
//

import Foundation
import CoreGraphics

struct HexagonParameters {
    
    // each segment is one side of a hexagon
    struct Segment {
        let line: CGPoint  // each side starts where the prev ends, moves in a straight line to the first point
        let curve: CGPoint  // Bezier curve
        let control: CGPoint // shape of the curve
    }
    
    static let adjustment: CGFloat = 0.085
    
    static let segments = [
        Segment(
            line: CGPoint(x: 0.60, y: 0.05),
            curve: CGPoint(x: 0.40, y: 0.05),
            control: CGPoint(x: 0.50, y: 0.00)
        ),
        Segment(
            line: CGPoint(x: 0.05, y: 0.20 + adjustment),
            curve: CGPoint(x: 0.00, y: 0.30 + adjustment),
            control: CGPoint(x: 0.00, y: 0.25 + adjustment)
        ),
        Segment(
            line: CGPoint(x: 0.00, y: 0.70 - adjustment),
            curve: CGPoint(x: 0.05, y: 0.80 - adjustment),
            control: CGPoint(x: 0.00, y: 0.75 - adjustment)
        ),
        Segment(
            line: CGPoint(x: 0.40, y: 0.95),
            curve: CGPoint(x: 0.60, y: 0.95),
            control: CGPoint(x: 0.50, y: 1.00)
        ),
        Segment(
            line: CGPoint(x: 0.95, y: 0.80 - adjustment),
            curve: CGPoint(x: 1.00, y: 0.70 - adjustment),
            control: CGPoint(x: 1.00, y: 0.75 - adjustment)
        ),
        Segment(
            line: CGPoint(x: 1.00, y: 0.30 + adjustment),
            curve: CGPoint(x: 0.95, y: 0.20 + adjustment),
            control: CGPoint(x: 1.00, y: 0.25 + adjustment)
        ),
    ]
}
