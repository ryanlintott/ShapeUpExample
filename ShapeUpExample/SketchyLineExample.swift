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
        ZStack {
            Color.suPurple.edgesIgnoringSafeArea(.all)
            
            Text("Hello World")
                .font(.system(size: 32))
                .foregroundColor(.suWhite)
                .alignmentGuide(.bottom) { d in
                    return d[.firstTextBaseline]
                }
                .background(
                    SketchyLines(lines: [
                        .leading(startExtension: -2, endExtension: 10),
                        .bottom(startExtension: 5, endExtension: 5, offset: .relative(0.05))
                    ], drawAmount: 1)
                        .stroke(Color.suPink, lineWidth: 2)
                    , alignment: .bottom
                )
        }
            .navigationTitle("SketchyLine")
    }
}

struct SketchyLineExample_Previews: PreviewProvider {
    static var previews: some View {
        SketchyLineExample()
    }
}
