//
//  ShapeLibraryExample.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2021-08-13.
//

import ShapeUp
import SwiftUI

struct ShapeLibraryExample: View {
    var body: some View {
        CSCustom { rect in
            CSPentagon(
                pointHeight: .relative(0.2),
                topTaper: .relative(0.15),
                bottomTaper: .zero
            )
            .corners(in: rect)
            .applyingStyle(.rounded(radius: .absolute(30)))
            .addingNotches([
                .triangle(depth: .relative(0.2)),
                nil,
                nil,
                .triangle(depth: .relative(0.2)),
                .rectangle(length: .absolute(50), depth: .absolute(20), cornerStyle: .rounded(radius: .relative(0.4)))
            ])
        }
        .padding()
    }
}

struct ShapeLibraryExample_Previews: PreviewProvider {
    static var previews: some View {
        ShapeLibraryExample()
    }
}
