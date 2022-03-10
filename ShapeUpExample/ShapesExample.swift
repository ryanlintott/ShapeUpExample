//
//  ShapesExample.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2021-08-13.
//

import ShapeUp
import SwiftUI

struct ShapesExample: View {
    var body: some View {
        List {
            NavigationLink(destination: CornerRectangleExample()) {
                Label("CornerRectangle", systemImage: "rectangle")
            }
            
            NavigationLink(destination: CornerTriangleExample()) {
                Label("CornerTriangle", systemImage: "triangle")
            }
            
            NavigationLink(destination: CornerPentagonExample()) {
                Label("CornerPentagon", systemImage: "pentagon")
            }
        }
        .navigationTitle("Shapes")
    }
}

struct ShapesExample_Previews: PreviewProvider {
    static var previews: some View {
        ShapesExample()
    }
}
