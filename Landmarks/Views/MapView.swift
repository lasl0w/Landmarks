//
//  MapView.swift
//  Landmarks
//
//  Created by tom montgomery on 1/21/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    // this view will update any time the coordinate changes
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        // we just have the region?  don't need to pass in the EO?
        // using a constant binding b/c in this use case we don't need to detect when the user moves the map
        Map(position: .constant(.region(region)))
    }
    
    // create the region we want the map to be centered on
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
    //_868 _286
}



#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
