//
//  Layout_Behavior.swift
//  SwiftUI-QuickStart
//
//  Created by SamsonCJ on 2022/6/12.
//

import SwiftUI

struct ViewSizes_Pull_In: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Layout Behavior").font(.largeTitle)
            Text("Views that Pull In").foregroundColor(.gray)
            Text("Some Views minimize thier frame size so it is only as big as the content within it.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(.purple)
                .foregroundColor(.white)
            
            Image(systemName: "arrow.down.to.line.alt")
            
            HStack {
                Image(systemName: "arrow.right.to.line.alt")
                Text("Text views pull in")
                Image(systemName: "arrow.left.to.line.alt")
            }
            
            Image(systemName: "arrow.up.to.line.alt")
            
            Text("Pull-In views tend to center themselves within their parent container view.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(.purple)
                .foregroundColor(.white)
            
        }.font(.title)
    }
}

struct ViewSizes_Push_Out: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Layout Behavior")
            Text("Views that Push Out")
                .font(.title).foregroundColor(.gray)
            Text("Some views will push out to fill up all available space wihin their parent.")
                .frame(maxWidth: .infinity).padding().font(.title)
                .background(.purple)
            
            
            Color.purple
                // Add 5 layers on top of the color view
                .overlay(alignment: .topLeading) {
                    Image(systemName: "arrow.up.left")
                        .padding()
                }
                .overlay(alignment: .topTrailing) {
                    Image(systemName: "arrow.up.right")
                        .padding()
                }
                .overlay(alignment: .bottomLeading) {
                    Image(systemName: "arrow.down.left")
                        .padding()
                }
                .overlay(alignment: .bottomTrailing) {
                    Image(systemName: "arrow.down.right")
                        .padding()
                }
                .overlay(Text("Colors are Push-Out views"))
        } // end of VStack
        .font(.largeTitle)
    }
}

struct Layout_Behavior_Previews: PreviewProvider {
    static var previews: some View {
//        ViewSizes_Pull_In()
        ViewSizes_Push_Out()
    }
}
