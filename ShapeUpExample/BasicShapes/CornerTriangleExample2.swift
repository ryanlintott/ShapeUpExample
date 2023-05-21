//
//  CornerTriangleExample2.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2023-05-20.
//

import ShapeUp
import SwiftUI

struct CornerTriangleExample2: View {
    @State private var topPoint = 0.6
    @State private var inset = 0.0
    
    var body: some View {
        VStack {
            Color.clear.overlay(
                CornerTriangle(topPoint: .relative(topPoint), styles: [
                    .top: .straight(radius: 10),
                    .bottomRight: .rounded(radius: .relative(0.3)),
                    .bottomLeft: .concave(radius: .relative(0.2))
                ])
                .inset(by: inset)
                .fill(Color.suCyan)
                .animation(.default, value: topPoint)
                .animation(.default, value: inset)
            )

            
            Stepper("Top Point \(String(format: "%.1F", topPoint))", value: $topPoint, in: 0...1, step: 0.1)
            
            Slider(value: $topPoint, in: 0...1) {
                Text("Top Point")
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("1")
            }
            
            Stepper("Inset \(String(format: "%.0F", inset))", value: $inset, in: -30...30, step: 10)
            
            Slider(value: $inset, in: -30...30) {
                Text("Inset")
            } minimumValueLabel: {
                Text("-30")
            } maximumValueLabel: {
                Text("30")
            }
        }
        .padding()
    }
}

struct CornerTriangleExample2_Previews: PreviewProvider {
    static var previews: some View {
        CornerTriangleExample2()
    }
}
