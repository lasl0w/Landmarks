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
    @State private var showingProfile = false
    
    var body: some View {
        NavigationSplitView {
            List {
                PageView(pages: modelData.featured.map {
                    FeatureCard(landmark: $0)
                })
                // resizable expanded it to the container width (but it was skewed, not a square)
                //    .resizable()
                // scaled to fill returned it to a square
                //    .scaledToFill()
                // .frame cut off some of the image top and made us flush with the list container
                //    .frame(height: 200)
                // .clipped cropped a bit more but gave us some padding
                //    .clipped()
                // set edgeInsets to zero so content can extend to the edge of the display (of the list container plus any child view padding)
                    .listRowInsets(EdgeInsets())
                
                
                // A list of categories (with a list of landmarks in each category).  a list of lists.
                ForEach(modelData.categories.keys.sorted(), id: \.self ) { key in
                    //Text(key)
                    // key = the category (rivers, lakes, mountains)
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                    // items: might be a landmark
                }
                .listRowInsets(EdgeInsets())
            }
            // mods on the list
            .listStyle(.inset)
            // .inset takes advantage of max width. allows for 2.25 items to be shown on horizontal lists.  indicator to user of scrolling
                .navigationTitle("Featured")
                .toolbar {
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                }
            // mods on the toolbar
                .sheet(isPresented: $showingProfile) {
                    ProfileHost()
                        .environment(modelData)
                }
        } detail: {
            Text("Select a landmark")
        }
    }
}

#Preview {
    CategoriesHome()
        .environment(ModelData())
}
