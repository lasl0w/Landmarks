//
//  PageView.swift
//  Landmarks
//
//  Created by tom montgomery on 2/22/24.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        // every time someone swipes, update that current page
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
            //Text("Current Page: \(currentPage)")
              
        }
        .aspectRatio(3 / 2, contentMode: .fit)

    }
}

// Preview initially fails b/c it can't infer a type
#Preview {
    PageView(pages: ModelData().featured.map { FeatureCard(landmark: $0) })
}
