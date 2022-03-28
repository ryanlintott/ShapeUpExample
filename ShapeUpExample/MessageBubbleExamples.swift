//
//  MessageBubbleExamples.swift
//  ShapeUpExample
//
//  Created by Eidinger, Marco on 3/27/22.
//

import ShapeUp
import SwiftUI

struct MessageBubbleExamples: View {
    var body: some View {
        List {
            NavigationLink(destination: MessageBubble0Example()) {
                Label("SwiftUI.Shape", systemImage: "bubble.middle.bottom")
            }

            NavigationLink(destination: MessageBubble1Example()) {
                Label("CornerShape", systemImage: "bubble.middle.bottom")
            }

            NavigationLink(destination: MessageBubble4Example()) {
                Label("CornerCustom", systemImage: "bubble.middle.bottom")
            }

            NavigationLink(destination: MessageBubble5Example()) {
                Label("CornerCustom - RelatableValue", systemImage: "bubble.middle.bottom")
            }

            NavigationLink(destination: MessageBubbleInsetExample()) {
                Label("CornerCustom - Insettable Shape", systemImage: "bubble.middle.bottom")
            }
            .navigationTitle("Message Bubble")
        }
    }
}

struct MessageBubbleExamples_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubbleExamples()
    }
}

