//
//  Form.swift
//  SwiftUI-QuickStart
//
//  Created by SamsonCJ on 2022/6/13.
//

import SwiftUI

struct Form_Intro: View {
    var body: some View {
        Form {
            Section {
                Text("This is a Form!")
                    .font(.title)
                Text("You can put any content in here")
                Text("The cells will grow to fit the content")
                Text("Remember, it's just views inside of views")
            }
            
            Section {
                Text("Limitations")
                    .font(.title)
                Text("There are built-in margins that difficult to get around. Take a look at the color below so you can see where the margins are:")
                Color.purple
            }
            
            Section {
                Text("Summary")
                    .font(.title)
                Text("Pretty much what you see here is what you get.")
            }
        }
    }
}

struct Form_Section_Headers_And_Footers: View {
    var body: some View {
        Form {
            Section {
                Text("You can add any view in a section header")
                Text("Notice the default foreground color is gray")
            } header: {
                Text("Section Header Text")
            }
            
            Section {
                Text("Here's an example of a section header with image and text")
            } header: {
                SectionTextAndImage(name: "People", image: "person.2.square.stack.fill")
            }
            
            Section {
                Text("Here is an example of a section footer")
            } footer: {
                Text("Total: $5,600.00").bold()
            }
        }
    }
}

struct Form_Section_Header_Prominence: View {
    var body: some View {
        Form {
            Section {
                Text("You have seen that you can customize the section header style. You can also use header prominence to style the header.")
            } header: {
                Text("Standard Header Prominence") // All uppercased
            }
            .headerProminence(.standard)
            
            Section {
                Text("Use increased header prominence to make it stand out more.")
            } header: {
                Text("Increased Header Prominence")
            }
            .headerProminence(.increased)
            
        }
    }
}

struct Form_Section_List_Row_Background: View {
    var body: some View {
        Form {
            Section {
                Text("List Row Background")
                    .foregroundColor(.gray)
                
                Text("Forms and Lists allow you to set a background view with a function called \"listRowBackground(view:)\".")
//
                Text("You can use this modifier on just one row, like this.")
                    .listRowBackground(Color.purple) // NOTE: can't use .purple, cause of 'View? '
                    .foregroundColor(.white)
            } header: {
                Text("Form").font(.largeTitle)
            }
            
            Section {
                Text("Or you can set a view or color for a whole section")
                    .listRowBackground(Color.purple)
                Text("Note, the color of the section header is not affected when set on Section.")
                    .fixedSize(horizontal: false, vertical: true)
                    .listRowBackground(Color.purple)
            } header: {
                Text("Whole Section")
                    .font(.title)
                    .foregroundColor(.gray)
            }
            .foregroundColor(.white)
            .listRowBackground(Color.purple) // not work in SwiftUI4
            
            Section {
                Text("Or you can set a view or color for a whole section")
                    .listRowBackground(Color.purple)
                    .listRowBackground(Color.purple)
                Text("Note, the color of the section header is not affected when set on Section.")
                    .fixedSize(horizontal: false, vertical: true)
                    .listRowBackground(Color.purple)
                    .listRowBackground(Color.purple)
            } header: {
                Text("Whole Section")
                    .font(.title)
                    .foregroundColor(.gray)
            }
            .foregroundColor(.white)
        }
        .font(.title2)
    }
}

struct SectionTextAndImage: View {
    var name: String
    var image: String
    var body: some View {
        HStack {
            Image(systemName: image).padding(.trailing)
            Text(name)
        }
        .padding()
        .font(.title)
        .foregroundColor(.purple)
    }
}

struct Form_Previews: PreviewProvider {
    static var previews: some View {
//        Form_Intro()
//        Form_Section_Headers_And_Footers()
//        Form_Section_Header_Prominence()
        Form_Section_List_Row_Background()
    }
}
