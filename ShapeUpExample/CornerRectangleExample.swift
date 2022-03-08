//
//  CornerRectangleExample.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2021-08-13.
//

import ShapeUp
import SwiftUI

struct CornerRectangleExample: View {
    var body: some View {
        VStack {
            CornerRectangle(
                topLeft: .straight(radius: 60),
                topRight: .cutout(radius: .relative(0.2)),
                bottomRight: .rounded(radius: .relative(0.8)),
                bottomLeft: .concave(radius: .relative(0.2))
            )
                .fill(Color.blue)
                .frame(width: 100, height: 100)
            
            CornerRectangle(.straight(radius: 20))
                .stroke()
                .frame(width: 100, height: 100)
            
            CornerRectangle(.rounded(radius: 4), corners: [.bottomLeft, .bottomRight])
                .stroke()
                .frame(width: 100, height: 100)
        }
        .navigationTitle("CornerRectangle")
    }
}

struct CornerRectangleExample_Previews: PreviewProvider {
    static var previews: some View {
        CornerRectangleExample()
    }
}
