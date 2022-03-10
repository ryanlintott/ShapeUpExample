//
//  AddOpenCornerShapeExample.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2022-02-11.
//

import ShapeUp
import SwiftUI

struct OpenCornerShape: Shape {
    func path(in rect: CGRect) -> Path {
        let corners = [
            Corner(x: rect.minX, y: rect.minY),
            Corner(x: rect.midX, y: rect.midY),
            Corner(x: rect.maxX, y: rect.minY),
            Corner(x: rect.maxX, y: rect.midY)
        ]
            .corners([
                .straight(radius: .relative(0.2)),
                .cutout(radius: .relative(0.2), cornerStyles: [
                    .rounded(radius: .relative(0.4)),
                    .point,
                    .straight(radius: .relative(0.4))
                ]),
                .cutout(radius: .relative(0.2), cornerStyles: [.rounded(radius: .relative(0.2))]),
                .rounded(radius: 20)
            ])
        
        var path = Path()
        path.move(to: CGPoint(x: rect.minX + rect.width * 0.25, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.midY), control: CGPoint(x: rect.midX, y: rect.midY))
        
        path.addOpenCornerShape(
            corners,
            previousPoint: CGPoint(x: rect.minX, y: rect.midY),
            nextPoint: CGPoint(x: rect.midX, y: rect.midY),
            moveToStart: false
        )
        
        path.addQuadCurve(to: CGPoint(x: rect.maxX - rect.width * 0.25, y: rect.maxY), control: CGPoint(x: rect.midX, y: rect.midY))

        return path
    }
}

struct AddOpenCornerShapeExample: View {
    var body: some View {
        VStack {
            OpenCornerShape()
                .stroke(.blue, lineWidth: 10)
                .frame(width: 200, height: 200)
                .navigationTitle("AddOpenCornerShape")
            
            Text("Regular SwiftUI Path with some Corners")
        }
    }
}

struct AddOpenCornerShapeExample_Previews: PreviewProvider {
    static var previews: some View {
        AddOpenCornerShapeExample()
    }
}
