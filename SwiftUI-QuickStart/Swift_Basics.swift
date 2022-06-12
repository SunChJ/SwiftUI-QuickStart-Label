//
//  Swift_Basics.swift
//  SwiftUI-QuickStart
//
//  Created by SamsonCJ on 2022/6/12.
//

import SwiftUI

struct Refactoring: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Refactoring")
                .font(.largeTitle) // Overrides .font(.title)
            
            Text("Reusing Modifer")
                .foregroundColor(Color.gray)
            
            Text("You can put common modifiers on the parent views to be applied to all the child views.")
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.white)
                .padding()
                .background(Color.blue)
        }
        .font(.title) // This font style will be applied to ALL text views inside the VStack
    }
}

struct SymbolsIntro: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Images")
                .font(.largeTitle)
            Text("Using SF Symbols")
                .foregroundColor(.gray)
            
            Text("You will see I use icons or symbols to add clarity to what I'm demonstrating.These come from Apple's new symbol font library which you can browse using an app called 'SF Symbols'.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
            
            // Use "systemName" when you want to use "SF Symbols"
            Image(systemName: "hand.thumbsup.fill")
                .font(.largeTitle)
            
            Image("SF Symbols")// Regular image from Assets.xcassets
                .scaledToFill()
        }
        .font(.title)
        .ignoresSafeArea(edges: .bottom)
    }
}

struct Layers: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Layers")
                .font(.largeTitle)
            
            Text("Using SF Symbols")
                .foregroundColor(.gray)
            
            Text("With SwiftUI views, you can add layers on top (.overlay) and behind (.background) the view.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
            
            Image("yosemite") // Show an image from Assets.xcassets
                .opacity(0.5) // Make iamge only 50% solid
                .background(Color.red.opacity(0.3)) // Layer behind image
                .background(Color.yellow.opacity(0.3)) // Layer behind red
                .background(Color.blue.opacity(0.3)) // Layer behind yellow
                .overlay(Text("Yosemite")) // Layer on top of image
            
            Image("Layers")
        }
        .font(.title)
    }
}

struct Shapes: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Shapes")
                .font(.largeTitle)
            
            Text("Short Introduction")
                .foregroundColor(.gray)
            
            Text("I'll make shapes, give them color and put them behind other views just for decoration.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
            
            Text("This text has a rounded rectangle behind it")
                .foregroundColor(.white)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20) // default color is black
                        .foregroundColor(.blue) // Make shape blue
                )
                .padding()

            Text("But sometimes I'll use color a corner radius:")
            
            Text("This text has a color with a corner radius")
                .foregroundColor(.white)
                .padding()
                .background(.blue) // Use a color as the background layer
                .cornerRadius(20) // Rounded courners on whole text view
        }
        .font(.title)
    }
}

struct Swift_Basics_Previews: PreviewProvider {
    static var previews: some View {
//        Refactoring()
//        SymbolsIntro()
//        Layers()
        Shapes()
    }
}
