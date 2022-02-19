//
//  ShapeUpLogoView.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2021-08-13.
//

import ShapeUp
import SwiftUI

struct ShapeUpLogo: CornerShape {
    var insetAmount: CGFloat = 0
    
    let arrowThickness: RelatableValue = .relative(0.35)
    
    func corners(in rect: CGRect) -> [Corner] {
        let arrowThickness = arrowThickness.value(using: rect.width)
        let arrowSide: [Corner] = [
            Corner(.straight(radius: .relative(0.1)), x: rect.midX - arrowThickness * 0.5, y: rect.maxY),
            Corner(.point, x: rect.midX - arrowThickness * 0.5, y: rect.midY),
            Corner(.rounded(radius: .relative(0.4)), x: rect.minX, y: rect.midY)
        ]
        let arrowPoint = Corner(.rounded(radius: .relative(0.1)), x: rect.midX, y: rect.minY)
        let arrow = arrowSide + [arrowPoint] + arrowSide.flippedHorizontally(across: rect.midX).reversed()
        
        return arrow
            .addingNotch(Notch(.triangle, depth: .relative(0.2)), afterCornerIndex: 6)
    }
}

struct ShapeUpLogoView: View {
    var body: some View {
        VStack {
            ShapeUpLogo()
                .fill(Color.blue)
                .aspectRatio(1, contentMode: .fit)
            
            Text("ShapeUp")
        }
        .navigationTitle("Logo")
    }
}

struct ShapeUpLogoView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeUpLogoView()
    }
}
