//
//  CornerCutRectangleView.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2021-08-13.
//

import ShapeUp
import SwiftUI

struct CornerCutRectangleExample: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.blue)
                .cutCorners(
                    topLeft: .straight(radius: .absolute(60)),
                    topRight: .cutout(radius: .relative(0.2)),
                    bottomLeft: .concave(radius: .relative(0.2)),
                    bottomRight: .rounded(radius: .relative(0.8))
                )
                .frame(width: 100, height: 100)
            
            CornerCutRectangle(.straight(radius: .absolute(20)))
                .stroke()
                .frame(width: 100, height: 100)
            
            CornerCutRectangle(.rounded(radius: .absolute(4)), corners: [.bottomLeft, .bottomRight])
                .stroke()
                .frame(width: 100, height: 100)
        }
    }
}

struct CornerCutRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        CornerCutRectangleExample()
    }
}