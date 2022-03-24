//
//  MessageBubble3Example.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2022-03-24.
//

import ShapeUp
import SwiftUI

struct MessageBubble3: CornerShape {
    var closed: Bool = true
    var insetAmount: CGFloat = 0
    
    let cornerRadius: RelatableValue
    let pointSize: RelatableValue
    let pointRadius: RelatableValue

    func corners(in rect: CGRect) -> [Corner] {
        rect
            .corners(.rounded(radius: cornerRadius))
            .addingNotch(
                .triangle(depth: -pointSize, cornerStyles: [
                    .rounded(radius: pointRadius),
                    .point,
                    .rounded(radius: pointRadius)
                ]),
                afterCornerIndex: 2
            )
    }
}

struct MessageBubble3Example: View {
    var body: some View {
        MessageBubble3(cornerRadius: 20, pointSize: 20, pointRadius: 10)
            .fill(Color.suPurple)
            .frame(width: 200, height: 120)
    }
}

struct MessageBubble3Example_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble3Example()
    }
}

