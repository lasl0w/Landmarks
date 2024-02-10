//
//  CategoryItem.swift
//  Landmarks
//
//  Created by tom montgomery on 2/10/24.
//

import SwiftUI

struct CategoryItem: View {
    // gotta pass in the landmark
    var landmark: Landmark
    
    
    var body: some View {
        VStack(alignment: .leading) {
            // don't need an image element.  This new shorthand?
            landmark.image
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
