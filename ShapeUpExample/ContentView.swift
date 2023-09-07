//
//  ContentView.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2021-08-13.
//

import SwiftUI

struct ContentView: View {
    var logo: some View {
        Image("ShapeUp-logo")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 400)
            .padding()
    }
    
    @ViewBuilder
    var examples: some View {
        Section {
            NavigationLink(destination: CornerExample()) {
                Label("Corner", systemImage: "arrow.up.forward.app")
            }
            
            NavigationLink(destination: CornerShapeExample()) {
                Label("CornerShape", systemImage: "square.and.pencil")
            }
            
            NavigationLink(destination: CornerCustomExample()) {
                Label("CornerCustom", systemImage: "skew")
            }
            
            NavigationLink(destination: NestedCornerStyleExample()) {
                Label("Nested CornerStyle", systemImage: "seal")
            }
            
            NavigationLink(destination: AddOpenCornerShapeExample()) {
                Label("AddOpenCornerShape", systemImage: "scribble")
            }
            
            
        } header: {
            Text("Corner")
        }
        
        BasicShapes()
        
        Section {
            NavigationLink(destination: ShapeUpLogoView()) {
                Label("ShapeUp Logo", systemImage: "arrowtriangle.up")
            }
            
            NavigationLink(destination: InsetCornerShapeExample()) {
                Label("InsetCornerShape", systemImage: "rectangle.inset.filled")
            }
        } header: {
            Text("Custom Shapes")
        }
        
        NotchedExamples()
        
        Section {
            NavigationLink(destination: InsettableShapeByPropertyExample()) {
                Label("InsetByProperty", systemImage: "triangle.inset.filled")
            }
            
            NavigationLink(destination: SketchyLineExample()) {
                Label("SketchyLine", systemImage: "highlighter")
            }
            
            NavigationLink(destination: EmbossExample()) {
                Label("Emboss", systemImage: "rectangle.dashed")
            }
            
            if #available(iOS 17, macOS 14, *) {
                NavigationLink(destination: AnimatablePackExample()) {
                    Label("AnimatablePack", systemImage: "slider.horizontal.3")
                }
            }
        } header: {
            Text("Other Tools")
        }
        
        Section {
            NavigationLink(destination: BasicCompareExample()) {
                Label("Code Comparison", systemImage: "rectangle.grid.1x2")
            }
            
            NavigationLink(destination: MessageBubbleExamples()) {
                Label("Drawing Methods", systemImage: "rectangle.inset.filled")
            }
        } header: {
            Text("Code Features")
        }
    }
    
    let title = "ShapeUp"
    
    var body: some View {
        #if os(iOS)
        NavigationView {
            VStack {
                logo
                
                List {
                    examples
                }
            }
            .navigationTitle(title)
            .navigationBarHidden(true)
        }
        #else
        if #available(macOS 13, *) {
            NavigationSplitView {
                VStack {
                    logo

                    List {
                        examples
                    }
                }
                .navigationTitle(title)
            } detail: {
                Text("Select an example.")
            }
        } else {
            NavigationView {
                VStack {
                    logo
                    
                    List {
                        examples
                    }
                }
                .navigationTitle(title)
                
                Text("Select an example.")
            }
        }
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
