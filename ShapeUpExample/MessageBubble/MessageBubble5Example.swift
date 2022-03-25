//
//  MessageBubble5Example.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2022-03-24.
//

import ShapeUp
import SwiftUI

struct MessageBubble5Example: View {
    let messageBubble = CornerCustom { rect in
        rect.corners(.rounded(radius: .relative(0.2)))
            .applyingStyle(.rounded(radius: .relative(0.3)), corners: [2,3])
            .addingNotch(
                .triangle(length: .relative(0.2), depth: -20, cornerStyles: [
                    .rounded(radius: .relative(0.2)),
                    .point,
                    .rounded(radius: .relative(0.2))
                ]),
                afterCornerIndex: 2
            )
    }
    
    var body: some View {
        VStack {
            ForEach(2...5, id: \.self) { i in
                Spacer()
                messageBubble
                    .aspectRatio(1.5, contentMode: .fit)
                    .frame(width: 50 * CGFloat(i))
            }
            Spacer()
        }
        .foregroundColor(.suPurple)
    }
}

struct MessageBubble5Example_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble5Example()
    }
}
