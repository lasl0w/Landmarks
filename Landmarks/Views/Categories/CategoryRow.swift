//
//  CategoryRow.swift
//  Landmarks
//
//  Created by tom montgomery on 2/10/24.
//

import SwiftUI

// horizontaly scrollable list, just what we need in HOTWIK
struct CategoryRow: View {
    
    var categoryName: String
    var items: [Landmark]
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            // set scrollview axis to horizontal!  brings it back to vertically centered....
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        //Text(landmark.name)
                        NavigationLink {
                            // the link
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            // the label
                            CategoryItem(landmark: landmark)
                        }

                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    // TODO: why not use .environmentObject?
    // create an instance of ModelData() and let the landmarks = our new property
    let landmarks = ModelData().landmarks
    // must return it now that we are 'let'ing things in the preview
    
    return CategoryRow(
        categoryName: landmarks[0].category.rawValue,
        // filter the landmarks array down to just the first 3 or 4 objects (if your list is giant)
        items: Array(landmarks.prefix(4)))
}
