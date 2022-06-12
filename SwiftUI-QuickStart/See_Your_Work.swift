//
//  See_Your_Work.swift
//  SwiftUI-QuickStart
//
//  Created by SamsonCJ on 2022/6/12.
//

import SwiftUI

struct Previews_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Previews").font(.largeTitle)
            Text("Introduction").foregroundColor(.gray)
            Text("Xcode looks for a struct that conforms to the PreviewProvider protocol and accesses its previews property to display a view on the Canvas.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(.red)
                .foregroundColor(.white)
            
        }.font(.title)
    }
}

struct Previews_DarkMode: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Previews").font(.largeTitle)
            Text("Dark Mode").foregroundColor(.gray)
            Text("By default, your preview will show in light mode. To see it in dark mode, you can use the environment modifier.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(.red)
                .foregroundColor(.white)
            
        }.font(.title)
    }
}

// Xcode looks for PreviewProvider struct
struct See_Your_Work_Previews: PreviewProvider {
    // It will access this property to get a view to show in the Canvas (if the Canvas is shown)
    static var previews: some View {
        // Instantiate and return your view inside this property to see a preview of it
//        Previews_Intro()
        
        // Canvans for iPhone / or Your current Simulator Type
        Previews_DarkMode()
        
        // Canvans for iPad
        Previews_DarkMode()
            .preferredColorScheme(.dark) // Deafult Light Mode. Recommond 「Color Scheme Variants」in Xcode 14, it's better.
        
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
        
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        /*
         Options:
         case accessibilityExtraExtraExtraLarge
         case accessibilityExtraExtraLarge
         case accessibilityExtraLarge
         case accessibilityLarge
         case accessibilityMedium
         case extraExtraExtraLarge
         case extraExtraLarge
         case extraLarge
         case extraSmall
         case large
         case medium
         case small
         */
        
            .previewInterfaceOrientation(.landscapeLeft)

    }
}
