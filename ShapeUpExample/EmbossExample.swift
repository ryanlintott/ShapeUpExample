//
//  EmbossExample.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2021-09-16.
//

import ShapeUp
import SwiftUI

struct EmbossExample: View {
    let angle: Angle = .degrees(45)
    
    var body: some View {
        VStack(spacing: 40) {
            Circle()
                .fill(Color.suPurple)
                .emboss(using: Circle(), size: 4, angle: angle, opacity: 1)
            
            Image(systemName: "heart")
                .resizable()
                .scaledToFit()
                .deboss(baseColor: .suPurple, amount: 1, blur: 1, angle: angle, opacity: 0.3)
            
            Text("Hello World")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.suPurple)
                .deboss(amount: 0.5, angle: angle, opacity: 0.5)
                
            CornerPentagon(pointHeight: 20, topTaper: .relative(0.5), bottomTaper: .relative(0.2))
                .embossEdges(size: 4, angle: angle, opacity: 1)
        }
        .padding(50)
        .background(Color.suPurple.edgesIgnoringSafeArea(.all))
        .navigationTitle("Emboss")
    }
}

struct EmbossExample_Previews: PreviewProvider {
    static var previews: some View {
        EmbossExample()
    }
}
