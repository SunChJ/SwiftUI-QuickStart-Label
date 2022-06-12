//
//  Starting_With_The_Title.swift
//  SwiftUI-QuickStart
//
//  Created by SamsonCJ on 2022/6/12.
//

import SwiftUI

struct Title: View {
    var body: some View {
        Text("Title") // Create text on the screen
            .font(.largeTitle) // Use a font modifier to make text larger
    }
}

struct AddVStack: View {
    var body: some View  {
        // Only one view can be return from the body property
        // Add 20 points between views within this container
        VStack(spacing: 20) { // Vstack is a container view that can hold up to 10 views
            Text("Title")
                .font(.largeTitle)
            
        }
    }
}

struct Subtitle: View {
    var body: some View  {
        VStack(spacing: 20) {
            Text("Title")
                .font(.largeTitle)
            
            Text("Subtitle")
                .font(.title) // Set to be the second largest font
                .foregroundColor(Color.gray) // Change text color to gray
        }
    }
}

struct Description1: View {
    var body: some View  {
        VStack(spacing: 20) {
            Text("Title")
                .font(.largeTitle)
            
            Text("Subtitle")
                .font(.title)
                .foregroundColor(Color.gray)
            
            Text("Short description of what I am demonstrating goes here.")
                .font(.title)
                .foregroundColor(Color.white)
                .background(Color.blue) // Add the color blue behind the text.
        }
    }
}

struct Description2: View {
    var body: some View  {
        VStack(spacing: 20) {
            Text("Title")
                .font(.largeTitle)
            
            Text("Subtitle")
                .font(.title)
                .foregroundColor(Color.gray)
            
            Text("Short description of what I am demonstrating goes here.")
                .frame(maxWidth: .infinity) // Extend until you can't go anymore
                .font(.title)
                .foregroundColor(Color.white)
                .background(Color.blue)
                
        }
    }
}

struct Description3: View {
    var body: some View  {
        VStack(spacing: 20) {
            Text("Title")
                .font(.largeTitle)
            
            Text("Subtitle")
                .font(.title)
                .foregroundColor(Color.gray)
            
            Text("Short description of what I am demonstrating goes here.")
                .frame(maxWidth: .infinity)
                .font(.title)
                .foregroundColor(Color.white)
                .padding() // Add space all around the text
                .background(Color.blue)
                
                
        }
    }
}

struct Version2: View {
    var body: some View  {
        HeaderView("Title",
                   subtitle: "Subtitle",
                   desc: "Short description of what I am demonstrating goes here.",
                   back: .purple,
                   textColor: .white)
    }

}


struct HeaderView: View {
    @State var title: String
    @State var subtitle: String
    @State var desc: String
    @State var back: Color
    @State var textColor: Color
    
    init(_ title: String, subtitle: String, desc: String, back: Color, textColor: Color) {
        self.title = title
        self.subtitle = subtitle
        self.desc = desc
        self.back = back
        self.textColor = textColor
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.largeTitle)
            
            Text(subtitle)
                .font(.title)
                .foregroundColor(Color.gray)
            
            Text(desc)
                .frame(maxWidth: .infinity)
                .font(.title)
                .foregroundColor(textColor)
                .padding() // Add space all around the text
                .background(back)
                
                
        }
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
//        Title()
//        AddVStack()
//        Subtitle()
//        Description1()
//        Description2()
//        Description3()
        Version2()
    }
}
