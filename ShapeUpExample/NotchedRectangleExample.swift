//
//  NotchedRectangleExample.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2021-08-13.
//

import ShapeUp
import SwiftUI

struct NotchedRectangleExample: View {
    var body: some View {
        CSNotchedRectangle(
            top: .rectangle(depth: .absolute(50), cornerStyle: .rounded(radius: .absolute(10))),
            bottom: .triangle(position: .relative(0.6), length: .relative(0.4), depth: .relative(0.1)),
            left: .custom(depth: .absolute(60), corners: { rect in
                let corners: [Corner] = [
                    Corner(x: rect.midX, y: rect.minY),
                    Corner(x: rect.minX, y: rect.maxY),
                    Corner(.rounded(radius: .absolute(15)), x: rect.midX, y: rect.maxY),
                    Corner(x: rect.maxX, y: rect.minY)
                ]
                return corners
            }),
            cornerStyles: [
                .rounded(radius: .absolute(20)),
                .cutout(radius: .absolute(30)),
                .straight(radius: .absolute(70)),
                .rounded(radius: .absolute(20))
            ]
        )
        .strokeBorder(style: StrokeStyle(lineWidth: 20))
//            .fill(Color.blue)
            .frame(width: 300, height: 300)
    }
}

struct NotchedRectangleExample_Previews: PreviewProvider {
    static var previews: some View {
        NotchedRectangleExample()
    }
}
