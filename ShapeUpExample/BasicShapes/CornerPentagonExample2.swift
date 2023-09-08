//
//  CornerPentagonExample2.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2023-05-20.
//

import ShapeUp
import SwiftUI

struct CornerPentagonExample2: View {
    @State private var pointHeight = 0.6
    @State private var topTaper = 0.6
    @State private var bottomTaper = 0.6
    @State private var inset = 0.0
    
    var body: some View {
        VStack {
            Color.clear.overlay(
                CornerPentagon(
                    pointHeight: .relative(pointHeight),
                    topTaper: .relative(topTaper),
                    bottomTaper: .relative(bottomTaper)
                )
                .applyingStyle(.rounded(radius: .relative(0.2)))
                .inset(by: inset)
                .fill(Color.suCyan)
                .animation(.default, value: pointHeight)
                .animation(.default, value: topTaper)
                .animation(.default, value: bottomTaper)
                .animation(.default, value: inset)
            )
            
            
            Stepper("Point Height \(String(format: "%.1F", pointHeight))", value: $pointHeight, in: 0...1, step: 0.1)
            
            Stepper("Top Taper \(String(format: "%.1F", topTaper))", value: $topTaper, in: 0...1, step: 0.1)
            
            Stepper("Bottom Taper \(String(format: "%.1F", bottomTaper))", value: $bottomTaper, in: 0...1, step: 0.1)
            
            Stepper("Inset \(String(format: "%.0F", inset))", value: $inset, in: -30...30, step: 10)
        }
        .padding()
        .navigationTitle("CornerPentagon")
    }
}

struct CornerPentagonExample2_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CornerPentagonExample2()
        }
    }
}
