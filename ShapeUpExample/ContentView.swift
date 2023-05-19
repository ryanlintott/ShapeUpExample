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
                
                List {
                    Group {
                        NavigationLink(destination: ShapeUpLogoView()) {
                            Label("ShapeUp Logo", systemImage: "arrowtriangle.up")
                        }
                        
                        NavigationLink(destination: BasicCompareExample()) {
                            Label("Basic Comparison", systemImage: "rectangle.grid.1x2")
                        }
                        
                        NavigationLink(destination: CornerStyleExample()) {
                            Label("CornerStyle", systemImage: "arrow.up.forward.app")
                        }
                        
                        NavigationLink(destination: CornerShapeExample()) {
                            Label("CornerShape", systemImage: "square.and.pencil")
                        }
                        
                        NavigationLink(destination: CornerCustomExample()) {
                            Label("CornerCustom", systemImage: "skew")
                        }
                    }
                    
                    NavigationLink(destination: ShapesExample()) {
                        Label("Shapes", systemImage: "pentagon")
                    }
                    
                    NavigationLink(destination: NestedCornerStyleExample()) {
                        Label("Nested CornerStyle", systemImage: "seal")
                    }
                    
                    NavigationLink(destination: NotchedExample()) {
                        Label("Notched", systemImage: "bookmark")
                    }

                    NavigationLink(destination: MessageBubbleExamples()) {
                        Label("Message Bubble", systemImage: "bubble.middle.bottom")
                    }
                    
                    NavigationLink(destination: InsetCornerShapeExample()) {
                        Label("InsetCornerShape", systemImage: "rectangle.inset.filled")
                    }
                    
                    NavigationLink(destination: AddOpenCornerShapeExample()) {
                        Label("AddOpenCornerShape", systemImage: "scribble")
                    }
                    
                    Group {
                        NavigationLink(destination: SketchyLineExample()) {
                            Label("SketchyLine", systemImage: "highlighter")
                        }
                        
                        NavigationLink(destination: InsettableShapeByPropertyExample()) {
                            Label("InsetByProperty", systemImage: "circle.inset.filled")
                        }
                        
                        NavigationLink(destination: EmbossExample()) {
                            Label("Emboss", systemImage: "rectangle.dashed")
                        }
                    }
                }
            }
            .navigationTitle("ShapeUp")
            .navigationBarHidden(true)
        }
        .navigationViewStyle(.stack)
        .accentColor(.suPink)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
