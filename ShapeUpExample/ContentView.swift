//
//  ContentView.swift
//  ShapeUpExample
//
//  Created by Ryan Lintott on 2021-08-13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ShapeUpLogo()
                .tabItem {
                    Image(systemName: "chevron.up.square.fill")
                    Text("Logo")
                }
            
            CornerCutRectangleExample()
                .tabItem {
                    Image(systemName: "rectangle.roundedtop")
                    Text("CornerCut")
                }
            
            NotchedRectangleExample()
                .tabItem {
                    Image(systemName: "bookmark.fill")
                    Text("Notched")
                }
            
            ShapeLibraryExample()
                .tabItem {
                    Image(systemName: "hexagon.fill")
                    Text("Library")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
