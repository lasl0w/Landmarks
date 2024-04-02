//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by tom montgomery on 3/6/24.
//

import SwiftUI

struct ContentView: View {
    
    // LandmarksApp entry already provides the .environment(ModelData()) at runtime, but preview needs it too.
    
    var body: some View {
            LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
