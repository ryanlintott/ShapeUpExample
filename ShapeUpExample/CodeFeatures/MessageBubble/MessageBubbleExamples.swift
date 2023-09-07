//
//  MessageBubbleExamples.swift
//  ShapeUpExample
//
//  Created by Eidinger, Marco on 3/27/22.
//

import ShapeUp
import SwiftUI

struct MessageBubbleExamples: View {
    @State private var insetAmount: CGFloat = 0
    @State private var cornerRadius: CGFloat = 20
    @State private var pointSize: CGFloat = 20
    @State private var pointRadius: CGFloat = 10
    
    let color: Color = .suPink
    let textColor: Color = .suWhite
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 50) {
                    MessageBubble0(
                        cornerRadius: cornerRadius,
                        pointSize: pointSize,
                        pointRadius: pointRadius
                    )
                    .fill(color)
                    .aspectRatio(1.5, contentMode: .fit)
                    .overlay(
                        VStack(alignment: .leading) {
                            Text("SwiftUI `Shape`")
                            Text("Not insettable.")
                        }
                            .foregroundColor(textColor)
                            .padding()
                    )
                    
                    MessageBubble1(
                        cornerRadius: .absolute(cornerRadius),
                        pointSize: pointSize,
                        pointRadius: .absolute(pointRadius)
                    )
                    .inset(by: insetAmount)
                    .fill(color)
                    .aspectRatio(1.5, contentMode: .fit)
                    .overlay(
                        VStack(alignment: .leading) {
                            Text("Changed to `CornerShape`")
                            Text("Insettable without extra code.")
                            Text("Corner radii can be relative to shape scale.")
                        }
                            .foregroundColor(textColor)
                            .padding()
                    )
                    
                    MessageBubble2(
                        cornerRadius: .absolute(cornerRadius),
                        pointSize: pointSize,
                        pointRadius: .absolute(pointRadius)
                    )
                    .inset(by: insetAmount)
                    .fill(color)
                    .aspectRatio(1.5, contentMode: .fit)
                    .overlay(
                        VStack(alignment: .leading) {
                            Text("`flippedHorizontally` used so only half the corners need to be specified.")
                        }
                            .foregroundColor(textColor)
                            .padding()
                    )
                    
                    MessageBubble3(
                        cornerRadius: .absolute(cornerRadius),
                        pointSize: .absolute(pointSize),
                        pointRadius: .absolute(pointRadius)
                    )
                    .inset(by: insetAmount)
                    .fill(color)
                    .aspectRatio(1.5, contentMode: .fit)
                    .overlay(
                        VStack(alignment: .leading) {
                            Text("`rect.corners` used to draw the main shape and `.addingNotch` used to add the point.")
                        }
                            .foregroundColor(textColor)
                            .padding()
                    )
                    
                    MessageBubble4(
                        cornerRadius: .absolute(cornerRadius),
                        pointSize: .absolute(pointSize),
                        pointRadius: .absolute(pointRadius),
                        insetAmount: insetAmount
                    )
                    .foregroundColor(color)
                    .aspectRatio(1.5, contentMode: .fit)
                    .overlay(
                        VStack(alignment: .leading) {
                            Text("`CornerCustom` shape created inline in a SwiftUI view.")
                            Text("")
                        }
                            .foregroundColor(textColor)
                            .padding()
                    )
                }
                .frame(maxWidth: 400)
                .padding()
            }
            
            Slider(value: $cornerRadius, in: 0...80) {
                Text("Corner Radius")
            } minimumValueLabel: {
                Text("Corner Radius")
            } maximumValueLabel: {
                Text("")
            }
            
            Slider(value: $pointSize, in: 0...50) {
                Text("Point Size")
            } minimumValueLabel: {
                Text("Point Size")
            } maximumValueLabel: {
                Text("")
            }
            
            Slider(value: $pointRadius, in: 0...40) {
                Text("Point Radius")
            } minimumValueLabel: {
                Text("Point Radius")
            } maximumValueLabel: {
                Text("")
            }
            
            Slider(value: $insetAmount, in: -10...10) {
                Text("Inset Amount")
            } minimumValueLabel: {
                Text("Inset Amount")
            } maximumValueLabel: {
                Text("")
            }
        }
        .padding()
        .navigationTitle("Drawing Methods")
    }
}

struct MessageBubbleExamples_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MessageBubbleExamples()
        }
    }
}

