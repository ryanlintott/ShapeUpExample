//
//  CornerStyleExample2.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2023-05-19.
//

import ShapeUp
import SwiftUI

struct CornerStyleExample2: View {
    let shapes = ["Rectangle", "Triangle", "Pentagon"]
    let styles: [CornerStyle] = [.point, .rounded(radius: .zero), .concave(radius: .zero), .straight(radius: .zero), .cutout(radius: .zero)]
    let radii: [RelatableValue] = [.absolute(.zero), .relative(.zero)]
    
    @State private var shape = "Rectangle"
    @State private var style = CornerStyle.rounded(radius: .zero)
    @State private var relativeRadius = true
    @State private var relative = 0.2
    @State private var absolute = 25.0
    
    var adjustedStyle: CornerStyle {
        style.changingRadius(to: relativeRadius ? .relative(relative) : .absolute(absolute))
    }
    
    var body: some View {
        VStack {
            Color.clear.overlay(
                Group {
                    switch shape {
                    case "Rectangle":
                        CornerRectangle()
                            .applyingStyle(adjustedStyle)
                    case "Triangle":
                        CornerTriangle()
                            .applyingStyle(adjustedStyle)
                    default:
                        CornerPentagon(pointHeight: .relative(0.3), bottomTaper: .relative(0.2))
                            .applyingStyle(adjustedStyle)
                    }
                }
            )
            .foregroundColor(Color.suPink)
            .padding()
            
            Picker("Base Shape", selection: $shape) {
                ForEach(shapes, id: \.self) { shape in
                    Text(shape)
                }
            }
            .pickerStyle(.segmented)
            
            Picker("CornerStyle", selection: $style) {
                ForEach(styles, id: \.self) { style in
                    Text(style.name)
                }
            }
            .pickerStyle(.segmented)
            
            Group {
                Toggle("Relative Radius", isOn: $relativeRadius)
                
                if relativeRadius {
                    Slider(value: $relative, in: 0...1) {
                        Text("Relative Value")
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("1")
                    }
                    
                    Stepper("Relative Value \(relative)", value: $relative, in: 0...1, step: 0.1)
                } else {
                    Slider(value: $absolute, in: 0...300) {
                        Text("Absolute Value")
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("300")
                    }
                    
                    Stepper("Absolute Value \(String(format: "%.0F", absolute))", value: $absolute, in: 0...300, step: 10)
                }
            }
            .disabled(style == .point)

        }
        .padding()
        .navigationTitle("CornerStyle")
    }
}

struct CornerStyleExample2_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CornerStyleExample2()
        }
    }
}
