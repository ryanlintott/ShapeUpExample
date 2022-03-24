//
//  MessageBubble4Example.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2022-03-24.
//

import ShapeUp
import SwiftUI

struct MessageBubble4Example: View {
    var body: some View {
        CornerCustom { rect in
            rect
                .corners(.rounded(radius: 20))
                .addingNotch(
                    .triangle(depth: -20, cornerStyles: [
                        .rounded(radius: 10),
                        .point,
                        .rounded(radius: 10)
                    ]),
                    afterCornerIndex: 2
                )
        }
        .fill(Color.suPurple)
        .frame(width: 200, height: 120)
    }
}

struct MessageBubble4Example_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble4Example()
    }
}
