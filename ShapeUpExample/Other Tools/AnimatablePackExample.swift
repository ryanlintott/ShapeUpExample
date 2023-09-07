//
//  AnimatablePackExample.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2023-09-06.
//

import ShapeUp
import SwiftUI

@available(iOS 17, macOS 14, *)
struct AnimatablePackShape: CornerShape, Animatable {
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

@available(iOS 17, macOS 14, *)
struct AnimatablePackExample: View {
    @State private var insetAmount: Double = 0
    @State private var cornerRadius: Double = 40
    @State private var rotation: Double = 0
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Animate lots of properties in a `Shape` using `AnimatablePack` instead of nesting `AnimatablePair` types")
            }
            
            AnimatablePackShape(
                insetAmount: insetAmount,
                cornerRadius: .absolute(cornerRadius),
                rotation: .degrees(rotation)
            )
            .fill(.blue)
            .padding()
            .animation(.easeInOut.speed(0.2), value: insetAmount)
            .animation(.easeInOut.speed(0.2), value: cornerRadius)
            .animation(.easeInOut.speed(0.2), value: rotation)
        
            Stepper("Inset Amount \(String(format: "%.2F", insetAmount))", value: $insetAmount, in: 0...200, step: 10)
            Stepper("Corner Radius \(String(format: "%.2F", cornerRadius))", value: $cornerRadius, in: 0...200, step: 20)
            Stepper("Rotation Angle \(String(format: "%.2F", rotation))", value: $rotation, in: -720...720, step: 45)
        }
        .padding()
        .navigationTitle("AnimatablePack")
    }
}

@available(iOS 17, macOS 14, *)
struct AnimatablePackExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimatablePackExample()
        }
    }
}
