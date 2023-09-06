//
//  AnimatablePackExample.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2023-09-06.
//

import ShapeUp
import SwiftUI

@available(iOS 17, *)
struct AnimatablePackExample: CornerShape, Animatable {
    var closed: Bool = true
    var insetAmount: CGFloat = 0
    
    var cornerRadius: RelatableValue
    var rotation: Angle
    
    func corners(in rect: CGRect) -> [Corner] {
        rect
            .corners(.rounded(radius: cornerRadius))
            .rotated(rotation, anchor: rect.point(.center))
    }
    
    var animatableData: AnimatablePack<CGFloat, RelatableValue, Double> {
        get { AnimatablePack(insetAmount, cornerRadius, rotation.radians) }
        set { (insetAmount, cornerRadius, rotation.radians) = newValue() }
    }
}

@available(iOS 17, *)
struct AnimatablePackExample_Previews: PreviewProvider {
    struct PreviewData: View {
        @State private var insetAmount: Double = 0
        @State private var cornerRadius: Double = 0
        @State private var rotation: Double = 0
        
        var body: some View {
            VStack {
                AnimatablePackExample(
                    insetAmount: insetAmount,
                    cornerRadius: .absolute(cornerRadius),
                    rotation: .degrees(rotation)
                )
                .fill(.blue)
                .padding()
            
                Stepper("Inset Amount", value: $insetAmount, in: 0...200, step: 10)
                Stepper("Corner Radius", value: $cornerRadius, in: 0...200, step: 20)
                Stepper("Rotation Angle", value: $rotation, in: -720...720, step: 45)
            }
            .animation(.easeInOut.speed(0.2), value: insetAmount)
            .animation(.easeInOut.speed(0.2), value: cornerRadius)
            .animation(.easeInOut.speed(0.2), value: rotation)
            .padding()
        }
    }
    
    static var previews: some View {
        PreviewData()
    }
}
