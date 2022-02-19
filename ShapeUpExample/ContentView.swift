//
//  ContentView.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2021-08-13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("ShapeUp-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 400)
                    .padding()
                
                Form {
                    NavigationLink(destination: ShapeUpLogoView()) {
                        Label("Logo", systemImage: "chevron.up.square.fill")
                    }
                    
                    NavigationLink(destination: AddOpenCornerShapeExample()) {
                        Label("AddOpenCornerShape", systemImage: "rectangle.roundedtop")
                    }
                    
                    NavigationLink(destination: InsetCornerShapeExample()) {
                        Label("InsetCornerShape", systemImage: "rectangle.roundedtop")
                    }
                    
                    NavigationLink(destination: CSRectangleExample()) {
                        Label("CornerCut", systemImage: "rectangle.roundedtop")
                    }
                    
                    NavigationLink(destination: NotchedRectangleExample()) {
                        Label("Notched", systemImage: "bookmark.fill")
                    }
                    
                    NavigationLink(destination: ShapeLibraryExample()) {
                        Label("Library", systemImage: "hexagon.fill")
                    }
                    
                    NavigationLink(destination: EmbossExample()) {
                        Label("Emboss", systemImage: "rectangle.dashed")
                    }
                    
                    NavigationLink(destination: SketchyLineExample()) {
                        Label("SketchyLine", systemImage: "highlighter")
                    }
                }
            }
            .navigationTitle("ShapeUp")
            .navigationBarHidden(true)
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
