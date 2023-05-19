//
//  HexagonExample.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2022-03-28.
//

import ShapeUp
import SwiftUI

struct HexagonExample: View {
    @State private var leftInset: CGFloat = 0.2
    
    var body: some View {
        VStack {
            CornerCustom { rect in
                rect
                    .points(relativeLocations: [
                        (leftInset, 0),
                        (0.8, 0),
                        (1, 0.5),
                        (0.8, 1),
                        (leftInset, 1),
                        (0, 0.5)
                    ])
                    .corners(.rounded(radius: 5))
            }
            .animation(.spring(), value: leftInset)
            Button("0.2") {
                leftInset = 0.2
            }
            Button("0.6") {
                leftInset = 0.6
            }
            Slider(value: $leftInset, in: 0...1)
        }
    }
}

struct HexagonExample_Previews: PreviewProvider {
    static var previews: some View {
        HexagonExample()
    }
}
