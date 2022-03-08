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
        var path = Path()
        
        let corners = [
            Corner(x: rect.minX, y: rect.minY),
            Corner(x: rect.midX, y: rect.midY),
            Corner(x: rect.maxX, y: rect.minY),
            Corner(x: rect.maxX, y: rect.maxY),
            Corner(x: rect.minX, y: rect.maxY)
        ]
            .applyingStyles([
                .straight(radius: .relative(0.1)),
                .straight(radius: .relative(0.2), cornerStyles: [.rounded(radius: 3)]),
                .cutout(radius: .relative(0.2), cornerStyles: [.rounded(radius: .relative(0.2))]),
                .cutout(radius: .relative(0.2), cornerStyles: [.rounded(radius: .relative(0.2))]),
                .rounded(radius: 20)
            ])

        path.addOpenCornerShape(corners)

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
            
            Text("An open ")
        }
    }
}

struct AddOpenCornerShapeExample_Previews: PreviewProvider {
    static var previews: some View {
        AddOpenCornerShapeExample()
    }
}
