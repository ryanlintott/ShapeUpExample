//
//  SketchyLineExample.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2021-08-13.
//

import ShapeUp
import SwiftUI

struct SketchyLineExample: View {
    var body: some View {
        Text("Hello World")
            .background(
                SketchyLines(lines: [
                    .leading(startExtension: .absolute(-2), endExtension: .absolute(10)),
                    .bottom(startExtension: .absolute(5), endExtension: .absolute(5), offset: .relative(0.1))
                ], drawAmount: 1)
                .stroke(Color.red)
                , alignment: .bottom
            )
    }
}

struct SketchyLineExample_Previews: PreviewProvider {
    static var previews: some View {
        SketchyLineExample()
    }
}
