//
//  ContentView.swift
//  Landmarks
//
//  Created by tom montgomery on 1/21/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        
        TabView(selection: $selection) {
            
            CategoriesHome()
                .tabItem { Label("Featured", systemImage: "star") }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem { Label("List", systemImage: "list.bullet") }
                .tag(Tab.list)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
