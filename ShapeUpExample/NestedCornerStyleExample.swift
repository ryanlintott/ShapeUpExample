//
//  NestedCornerStyleExample.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2022-03-09.
//

import ShapeUp
import SwiftUI

struct NestedCornerStyleExample: View {
    let straightCutout: CornerStyle = {
        let radius = RelatableValue.relative(0.25)
        
        return CornerStyle.straight(radius: radius, cornerStyle: .cutout(radius: radius))
    }()
    
    let cutoutStraight: CornerStyle = {
        let radius = RelatableValue.relative(0.3)
        
        return CornerStyle.cutout(radius: radius, cornerStyle: .straight(radius: radius))
    }()
    
    var body: some View {
        VStack {
            CornerTriangle()
                .applyingStyle(straightCutout)
                .strokeBorder(Color.suPink, lineWidth: 8)
                .frame(width: 200, height: 200)
            
            CornerPentagon(pointHeight: .relative(0.3), bottomTaper: .relative(0.2))
                .applyingStyle(cutoutStraight)
                .strokeBorder(Color.suCyan, lineWidth: 8)
                .frame(width: 200, height: 200)
        }
    }
}

struct NestedCornerStyleExample_Previews: PreviewProvider {
    static var previews: some View {
        NestedCornerStyleExample()
    }
}
