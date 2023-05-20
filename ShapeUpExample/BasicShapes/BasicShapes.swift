//
//  BasicShapes.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2021-08-13.
//

import ShapeUp
import SwiftUI

struct BasicShapes: View {
    var body: some View {
        Section {
            NavigationLink(destination: CornerRectangleExample()) {
                Label("CornerRectangle", systemImage: "rectangle")
            }
            
            NavigationLink(destination: CornerTriangleExample()) {
                Label("CornerTriangle", systemImage: "triangle")
            }
            
            NavigationLink(destination: CornerPentagonExample()) {
                Label("CornerPentagon", systemImage: "pentagon")
            }
        } header: {
            Text("Basic Shapes")
        }
    }
}

struct BasicShapes_Previews: PreviewProvider {
    static var previews: some View {
        List {
            BasicShapes()
        }
    }
}
