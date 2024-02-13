//
//  Landmark.swift
//  Landmarks
//
//  Created by tom montgomery on 1/23/24.
//

import Foundation
import SwiftUI  // Image is in swiftUI
import CoreLocation // required for CLLocationCoordinate2D

// add Identifiable for List simplification
struct Landmark: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    
    enum Category: String, CaseIterable, Codable {
        case rivers = "Rivers"
        case lakes = "Lakes"
        case mountains = "Mountains"
    }
    
    // private b/c users of the landmark struct care only about the image itself
    private var imageName: String
    var image: Image {
        // loads from the asset catalog
        Image(imageName)
    }
    // private as it's used only to create the public computed property
    private var coordinates: Coordinates
    
    // nice for passing to mapKit
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
}
