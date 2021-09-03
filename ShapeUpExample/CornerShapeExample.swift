//
//  CornerShapeView.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2021-08-13.
//

import ShapeUp
import SwiftUI

struct CornerShapeExample: View {
    let shape = CornerShape { rect in
        [
            Corner(.rounded(radius: .relative(0.1)),x: rect.minX, y: rect.minY),
            Corner(.rounded(radius: .relative(0.1)), x: rect.midX, y: rect.midY),
            Corner(.rounded(radius: .absolute(20)),x: rect.maxX, y: rect.minY),
            Corner(.rounded(radius: .relative(0.3)),x: rect.maxX, y: rect.maxY),
            Corner(.rounded(radius: .relative(0.1)),x: rect.midX, y: rect.maxY),
        ]
        .points
//        .map({ $0.mirrored(mirrorLineStart: CGPoint(x: rect.minX, y: rect.midY + 10), mirrorLineEnd: CGPoint(x: rect.maxX, y: rect.midY + 10)) })
//        .reversed()
        .corners()
//        .addingNotches(
//            [
//                Notch(.triangle(cornerStyle: .round(radius: .absolute(10))), depth: .absolute(50)),
//                Notch(.rectangle(cornerStyle: .round(radius: .absolute(15))), depth: .absolute(40)),
//                Notch(.rectangle(cornerStyle: .inverseRound(radius: .absolute(15))), depth: .absolute(40))
//            ]
//        )
//        .flattened
//        .addNotches(
//            [
//                Notch(.rectangle, depth: .absolute(10), cornerStyle: .round(radius: .absolute(5)))
//            ]
//        )
//        .addNotches(
//            [
//                Notch(.rectangle, depth: .absolute(5), cornerStyle: .round(radius: .absolute(5)))
//            ]
//        )
    }
    
    var body: some View {
        shape
            .fill(Color.blue)
            .overlay(
                CornerShape { rect in
                    [
                        Corner(.rounded(radius: .relative(0.1)),x: rect.minX, y: rect.minY),
                        Corner(.rounded(radius: .relative(0.1)), x: rect.midX, y: rect.midY),
                        Corner(.rounded(radius: .absolute(20)),x: rect.maxX, y: rect.minY),
                        Corner(.rounded(radius: .relative(0.3)),x: rect.maxX, y: rect.maxY),
                        Corner(.rounded(radius: .relative(0.1)),x: rect.midX, y: rect.maxY),
                        
                    ]
//                    .points
//                    .map({ $0.mirrored(mirrorLineStart: CGPoint(x: rect.minX, y: rect.minY - 10), mirrorLineEnd: CGPoint(x: rect.maxX, y: rect.midY + 10)) })
                    .reversed()
//                    .corners()
                }
//                    .inset(by: 15)
                    .fill(Color.black.opacity(0.5))
            )
            .frame(width: 300, height: 300)
    }
}

struct CornerShapeView_Previews: PreviewProvider {
    static var previews: some View {
        CornerShapeExample()
    }
}
