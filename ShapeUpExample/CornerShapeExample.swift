//
//  CornerShapeView.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2021-08-13.
//

import ShapeUp
import SwiftUI

struct CornerShapeExample: View {
    let shape = CSCustom { rect in
        [
            Corner(.rounded(radius: .relative(0.1)),x: rect.minX, y: rect.minY),
            Corner(.rounded(radius: .relative(0.1)), x: rect.midX, y: rect.midY),
            Corner(.rounded(radius: 20),x: rect.maxX, y: rect.minY),
            Corner(.rounded(radius: .relative(0.3)),x: rect.maxX, y: rect.maxY),
            Corner(.rounded(radius: .relative(0.1)),x: rect.midX, y: rect.maxY),
        ]
    }
    
    var body: some View {
        shape
            .fill(Color.blue)
            .overlay(
                CSCustom { rect in
                    [
                        Corner(.rounded(radius: .relative(0.1)),x: rect.minX, y: rect.minY),
                        Corner(.rounded(radius: .relative(0.1)), x: rect.midX, y: rect.midY),
                        Corner(.rounded(radius: 20),x: rect.maxX, y: rect.minY),
                        Corner(.rounded(radius: .relative(0.3)),x: rect.maxX, y: rect.maxY),
                        Corner(.rounded(radius: .relative(0.1)),x: rect.midX, y: rect.maxY),
                    ]
                    .map({ $0.mirrored(mirrorLineStart: CGPoint(x: rect.minX, y: rect.minY - 10), mirrorLineEnd: CGPoint(x: rect.maxX, y: rect.midY + 10)) })
                    .reversed()
                }
//                    .inset(by: 15)
                    .fill(Color.black.opacity(0.5))
            )
            .frame(width: 300, height: 300)
            .navigationTitle("CSCustom")
    }
}

struct CornerShapeView_Previews: PreviewProvider {
    static var previews: some View {
        CornerShapeExample()
    }
}
