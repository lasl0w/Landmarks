/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        // switch from .slide to move/edge so it comes and goes from the same side
        //AnyTransition.move(edge: .trailing)
        // use .asymmetric to provide different InOut transitions
        .asymmetric(
            // fly in from the left
            insertion: .move(edge: .trailing).combined(with: .opacity),
            // scale down to tiny and become opaque. infinitesmal (sp?).  way cool!
            removal: .scale.combined(with: .opacity)
            )
    }
}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = true

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button { 
                    withAnimation {
                        showDetail.toggle()
                    }

                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .padding()
                        //.animation(.spring(), value: showDetail)
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
                    .transition(.moveAndFade)
            }
        }
    }
}

#Preview {
    VStack {
        HikeView(hike: ModelData().hikes[0])
            .padding()
        Spacer()
    }
}
