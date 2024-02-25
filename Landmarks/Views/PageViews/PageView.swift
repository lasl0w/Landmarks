//
//  PageView.swift
//  Landmarks
//
//  Created by tom montgomery on 2/22/24.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    var pages: [Page]
    
    var body: some View {
        PageViewController(pages: pages)
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}

// Preview initially fails b/c it can't infer a type
#Preview {
    PageView(pages: ModelData().featured.map { FeatureCard(landmark: $0) })
}
