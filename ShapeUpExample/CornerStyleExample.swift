//
//  CornerStyleExample.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2022-03-10.
//

import ShapeUp
import SwiftUI

struct CornerStyleExample: View {
    let styles: [CornerStyle] = [
        .point,
        .rounded(radius: 15),
        .concave(radius: 15),
        .straight(radius: 15),
        .cutout(radius: 15)
    ]
    
    var body: some View {
        VStack {
            ForEach(styles, id: \.self) { style in
                ZStack {
                    Rectangle()
                        .applyingStyle(style)
                        .inset(by: -5)
                        .fill(Color.suPurple)
                    
                    Rectangle()
                        .applyingStyle(style)
                        .fill(Color.suCyan)
                    
                    Rectangle()
                        .applyingStyle(style)
                        .inset(by: 10)
                        .fill(Color.suYellow)
                    
                    Rectangle()
                        .applyingStyle(style)
                        .inset(by: 15)
                        .strokeBorder(Color.suPink, lineWidth: 5)
                    
                    Text(style.name)
                }
                .padding(5)
            }
        }
        .padding()
        .navigationTitle("CornerStyle")
    }
}

struct CornerStyleExample_Previews: PreviewProvider {
    static var previews: some View {
        CornerStyleExample()
    }
}
