//
//  InsetCornerShapeExample.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2022-02-11.
//

import ShapeUp
import SwiftUI

struct InsetCornerShape: Shape {
    func path(in rect: CGRect) -> Path {
        [
            Corner(x: rect.minX, y: rect.minY),
            Corner(x: rect.midX, y: rect.midY),
            Corner(x: rect.maxX, y: rect.minY),
            Corner(x: rect.maxX, y: rect.maxY),
            Corner(x: rect.minX, y: rect.maxY)
        ]
            .applyingStyle(.rounded(radius: .relative(0.2)))
            .inset(by: 10)
            .path()
    }
}

struct InsetCornerShapeExample: View {
    var body: some View {
        InsetCornerShape()
            .stroke(.blue, lineWidth: 2)
            .frame(width: 200, height: 200)
            .navigationTitle("InsetCornerShape")
    }
}

struct InsetCornerShapeExample_Previews: PreviewProvider {
    static var previews: some View {
        InsetCornerShapeExample()
    }
}
