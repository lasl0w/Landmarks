//
//  MapView.swift
//  Landmarks
//
//  Created by tom montgomery on 1/21/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        Map(initialPosition: .region(region))
    }
    
    // create the region we want the map to be centered on
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
    //_868 _286
}



#Preview {
    MapView()
}
