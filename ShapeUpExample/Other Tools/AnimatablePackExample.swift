//
//  AnimatablePackExample.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2023-09-06.
//

#if swift(>=999)
//#if swift(>=5.9)
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
            .fill(Color.suPink)
            .padding()
            .animation(.easeInOut.speed(0.2), value: insetAmount)
            .animation(.easeInOut.speed(0.2), value: cornerRadius)
            .animation(.easeInOut.speed(0.2), value: rotation)
        
            CrossPlatformStepper(
                label: "Inset",
                value: $inset,
                minValue: -30,
                maxValue: 30,
                step: 10
            )
            
            CrossPlatformStepper(
                label: "Corner Radius",
                value: $cornerRadius,
                minValue: 0,
                maxValue: 200,
                step: 20
            )
            
            CrossPlatformStepper(
                label: "Rotation Angle",
                value: $cornerRadius,
                minValue: -720,
                maxValue: 720,
                step: 45
            )
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
#endif
