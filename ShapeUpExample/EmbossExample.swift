//
//  EmbossExample.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2021-09-16.
//

import ShapeUp
import SwiftUI

struct EmbossExample: View {
    let color: Color = .blue
    let size: CGFloat = 4
    let angle: Angle = .degrees(45)
    let opacity: Double = 1
    
    var body: some View {
        VStack(spacing: 40) {
            Circle()
                .fill(color)
                .emboss(using: Circle(), size: size, angle: angle, opacity: opacity)
            
            Image(systemName: "heart")
                .resizable()
                .scaledToFit()
                .deboss(baseColor: .red, amount: 3, blur: 2, angle: angle, opacity: 0.8)
            
            Text("Hello World")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)
                .emboss(amount: 1, angle: angle + .degrees(180), opacity: 0.8)
                
            CSPentagon(pointHeight: 4, topTaper: .relative(0.5), bottomTaper: .relative(0.2))
                .embossEdges(size: size, angle: angle + .degrees(180), opacity: opacity)
        }
        .padding(50)
        .background(Color.gray)
        .navigationTitle("Emboss")
    }
}

struct EmbossExample_Previews: PreviewProvider {
    static var previews: some View {
        EmbossExample()
    }
}
