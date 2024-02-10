//
//  CategoriesHome.swift
//  Landmarks
//
//  Created by tom montgomery on 2/6/24.
//

import SwiftUI

struct CategoriesHome: View {
    
    // we need access to the categories (and other landmark data soon)
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(modelData.categories.keys.sorted(), id: \.self ) { key in
                    Text(key)
                }
            }
                .navigationTitle("Featured")
        } detail: {
            Text("Select a landmark")
        }
    }
}

#Preview {
    CategoriesHome()
        .environment(ModelData())
}
