//
//  ZStack.swift
//  SwiftUI-QuickStart
//
//  Created by SamsonCJ on 2022/6/12.
//

import SwiftUI

struct ZStack_Introduction: View {
    var body: some View {
        ZStack {
            // Layer 1: Furthest back
            Color.gray // Yes, Color is a view!
            
            // Layser 2: This VStack is on top
            VStack(spacing: 20) {
                Text("ZStack")
                    .font(.largeTitle)
                
                Text("Introduction")
                    .foregroundColor(.white)
                
                Text("ZStack are great for setting a background color.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.green)
                
                Text("But notice the Color stops at the Safe Areas (white areas on top and bottom).")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.green)
            }
            
        }.font(.title)
    }
}

struct ZStack_Ignores_Safe_Area_Edges: View {
    var body: some View {
        ZStack {
            Color.gray
            
            VStack(spacing: 20) {
                Text("ZStack")
                    .font(.largeTitle)
                
                Text("Introduction")
                    .foregroundColor(.white)
                
                Text("Ignoring the Safe Areas will extend a view to fill the whole scene.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.green)
            }
            .font(.title)
            
        }.ignoresSafeArea(.all) // Ignore the safe areas
    }
}

struct ZStack_background_problem: View {
    var body: some View {
        ZStack {
            Color.gray
            
            VStack(spacing: 20) {
                Text("ZStack") // This view is under the notch
                    .font(.largeTitle)
                
                Text("Introduction Safe Area Edges")
                    .foregroundColor(.white)
                
                Text("Having the ZStack edges ignoring the safe area edges might be a mistake.\nYou notice that the top Text View is completely under the notch.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.green)
                
                Spacer() // Added a spacer to push the views up.
            }
            .font(.title)
            
        }
        .ignoresSafeArea() // the same: Ignore the safe areas
    }
}

struct ZStack_background_solution: View {
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea() // Have JUST the color ignore the safe areas edges, not the VStack.
            
            VStack(spacing: 20) {
                Text("ZStack")
                    .font(.largeTitle)
                
                Text("Introduction Safe Area Edges")
                    .foregroundColor(.white)
                
                Text("To solve the problem, yout want just the color (bottom layer) to ignore the safe area edges and fill the screen. Other layer above it will stay within the Safe Area.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.green)
                
                Spacer()
            }
            .font(.title)
            
        }
    }
}

struct ZStack_layering: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("ZStack",
                       subtitle: "Layering & Aligning",
                       desc: "ZStack are great for layering views. For example, putting text on top of an image.",
                       back: .green,
                       textColor: .white)
            
            ZStack {
                Image("yosemite_large")
                    .resizable() // allows image to change size
                    .scaledToFit() // Keeps image the same aspect ratio when resizing
                
                Rectangle()
                    .fill(Color.white.opacity(0.6))
                    .frame(maxWidth: .infinity, maxHeight: 50)
                
                Text("Yosemite National Park")
                    .font(.title)
                    .foregroundColor(.purple)
                    .padding()
            }
            
            DescView(desc: "But what if you wanted to have all the views align to the bottom?", back: .green, textColor: .white)
            
        }.font(.title)
    }
}

struct ZStack_aligning: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("ZStack",
                       subtitle: "Aligning",
                       desc: "The ZStack allows you to align all view within it.",
                       back: .green,
                       textColor: .white)
            
            ZStack(alignment: .topLeading) {
                Image("yosemite_large")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Rectangle()
                    .fill(Color.white.opacity(0.6))
                    .frame(maxWidth: .infinity, maxHeight: 60)
                
                
                Text("Yosemite National Park")
                    .font(.title)
                    .foregroundColor(.purple)
                    .padding()
            }
            
            ZStack(alignment: .bottomTrailing) {
                Image("yosemite_large")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Rectangle()
                    .fill(Color.white.opacity(0.6))
                    .frame(maxWidth: .infinity, maxHeight: 60)
                
                
                Text("Yosemite National Park")
                    .font(.title)
                    .foregroundColor(.purple)
                    .padding()
            }
        }.font(.title)
    }
}

struct ZStack_Previews: PreviewProvider {
    static var previews: some View {
//        ZStack_Introduction()
//        ZStack_Ignores_Safe_Area_Edges()
//        ZStack_background_problem()
//        ZStack_background_solution()
//        ZStack_layering()
        ZStack_aligning()
    }
}
