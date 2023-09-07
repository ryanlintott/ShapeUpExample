//
//  InsettableShapeByPropertyExample.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2022-09-02.
//

import ShapeUp
import SwiftUI

struct InsettableShapeWithHole: InsettableShapeByProperty {
    var insetAmount: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        var path =
        rect.corners(.rounded(radius: 10))
            .inset(by: insetAmount)
            .path()
        path.closeSubpath()
        
        var hole = Path()
        hole.addArc(center: rect.point(.center), radius: rect.width * 0.25 + insetAmount, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: true)
        hole.closeSubpath()
        
        hole.addPath(path)
        
        return hole
    }
}

struct InsettableShapeByPropertyExample: View {
    @State private var inset: CGFloat = 10.0
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Turning a `Shape` into an `InsettableShape` can be cumbersome. In some cases it's possible to include the inset value as a parameter. The `InsettableShapeByProperty` protocol will generate the rest of the insetting code for you.")
            }
            
            Spacer()
            
            ZStack {
                InsettableShapeWithHole()
                    .stroke(lineWidth: 1)
                    .fill(.blue)
                
                InsettableShapeWithHole()
                    .inset(by: inset)
                    .stroke(lineWidth: 5)
            }
            .frame(width: 200, height: 200)
            
            Spacer()
            
            HStack {
                Text("Inset")
                Slider(value: $inset, in: -20...20)
            }
        }
        .padding()
        .navigationTitle("InsetByProperty")
    }
}
struct InsettableShapeByPropertyExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InsettableShapeByPropertyExample()
        }
    }
}