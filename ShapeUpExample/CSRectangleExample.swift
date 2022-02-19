//
//  CSRectangleExample.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2021-08-13.
//

import ShapeUp
import SwiftUI

struct CSRectangleExample: View {
    var body: some View {
        VStack {
            CSRectangle(
                topLeft: .straight(radius: 60),
                topRight: .cutout(radius: .relative(0.2)),
                bottomLeft: .concave(radius: .relative(0.2)),
                bottomRight: .rounded(radius: .relative(0.8))
            )
                .fill(Color.blue)
                .frame(width: 100, height: 100)
            
            CSRectangle(.straight(radius: 20))
                .stroke()
                .frame(width: 100, height: 100)
            
            CSRectangle(.rounded(radius: 4), corners: [.bottomLeft, .bottomRight])
                .stroke()
                .frame(width: 100, height: 100)
        }
        .navigationTitle("CSRectangle")
    }
}

struct CSRectangleExample_Previews: PreviewProvider {
    static var previews: some View {
        CSRectangleExample()
    }
}
