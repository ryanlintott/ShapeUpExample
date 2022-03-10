//
//  CornerShapeView.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2021-08-13.
//

import ShapeUp
import SwiftUI

struct TestClosedShape: CornerShape {
    var closed = true
    var insetAmount: CGFloat = 0
    
    func corners(in rect: CGRect) -> [Corner] {
        [
            Corner(.rounded(radius: .relative(0.3)),x: rect.minX, y: rect.minY),
            Corner(.straight(radius: .relative(0.1)), x: rect.midX, y: rect.midY),
            Corner(.cutout(radius: 20),x: rect.maxX, y: rect.minY),
            Corner(.concave(radius: .relative(0.3)),x: rect.maxX, y: rect.maxY),
            Corner(x: rect.midX, y: rect.maxY),
        ]
    }
}

struct TestOpenShape: CornerShape {
    var closed = false
    var insetAmount: CGFloat = 0
    
    func corners(in rect: CGRect) -> [Corner] {
        rect.points(.bottomLeft, .left, .bottom, .top, .right, .topRight)
            .corners([
                nil,
                .rounded(radius: .relative(0.4)),
                .concave(radius: .relative(0.3)),
                .straight(radius: .relative(0.3)),
                .cutout(radius: .relative(0.1)),
                nil
            ])
    }
}

struct CornerShapeExample: View {
    var body: some View {
        VStack {
            TestClosedShape()
                .fill(Color.suPink)
                .frame(width: 200, height: 150)
            
            Text("Closed Shape")
            
            TestOpenShape()
                .stroke(Color.suYellow, lineWidth: 12)
                .frame(width: 200, height: 150)
            
            Text("Open Shape")
        }
        .navigationTitle("CornerShape")
    }
}

struct CornerShapeView_Previews: PreviewProvider {
    static var previews: some View {
        CornerShapeExample()
    }
}
