//
//  NotchedExample.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2022-03-09.
//

import SwiftUI

import ShapeUp
import SwiftUI

struct NotchedExample: View {
    var body: some View {
        List {
            NavigationLink(destination: NotchedRectangleExample()) {
                Label("NotchedRectangle", systemImage: "rectangle")
            }
            
            NavigationLink(destination: NotchedTriangleExample()) {
                Label("NotchedTriangle", systemImage: "triangle")
            }
            
            NavigationLink(destination: NotchedPentagonExample()) {
                Label("NotchedPentagon", systemImage: "pentagon")
            }
        }
        .navigationTitle("Notched")
    }
}

struct NotchedExample_Previews: PreviewProvider {
    static var previews: some View {
        NotchedExample()
    }
}
