//
//  AnimatableArrayExample.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2023-09-07.
//

import ShapeUp
import SwiftUI

@available(iOS 17, *)
struct AnimatableArrayExample: CornerShape, Animatable {
    var closed: Bool = true
    var insetAmount: CGFloat = 0
    
    var cornerRadius: CGFloat
    var rotation: CGFloat
    
    func corners(in rect: CGRect) -> [Corner] {
        rect
            .corners(.rounded(radius: .absolute(cornerRadius)))
            .rotated(.degrees(rotation), anchor: rect.point(.center))
    }
    
    var animatableData: AnimatableArray<CGFloat> {
        get { [insetAmount, cornerRadius, rotation] }
        set {
            insetAmount = newValue[0]
            cornerRadius = newValue[1]
            rotation = newValue[2]
        }
    }
}

@available(iOS 17, *)
struct AnimatableArrayExample_Previews: PreviewProvider {
    struct PreviewData: View {
        @State private var insetAmount: Double = 0
        @State private var cornerRadius: Double = 0
        @State private var rotation: Double = 0
        
        var body: some View {
            VStack {
                Circle()
                    .padding(insetAmount)
                
                AnimatableArrayExample(
                    insetAmount: insetAmount,
                    cornerRadius: cornerRadius,
                    rotation: rotation
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
