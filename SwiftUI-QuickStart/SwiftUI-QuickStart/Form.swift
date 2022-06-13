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
            .listRowBackground(Color.purple) // FIXME: not work in SwiftUI4.
            
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

struct Form_Section_Background_Images: View {
    var body: some View {
        Form {
            Section {
                Text("List Row Background")
                    .foregroundColor(.gray)
                Text("Image work a little differently as you can see here.")
                Text("The image is actually set on a row in the second section.")
            } header: {
                Text("Form")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            Section {
                Text("An Image is set as a background for the row below, This works fine for rows, but when you use an image on the section level, it is repeated for all rows.")
                
                Text("The image is set on THIS row, but it extends past the bounds. It also hides the row below this one and goes under the previous rows.")
                    .foregroundColor(.white)
                    .listRowBackground(Image("wallpaper"))
                    .blur(radius: 3)
                    // FIXME: Not Work in SwiftUI 4
                Text("This row cannot be seen")
            } header: {
                Text("Images")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
        }
        .font(.title2)
        
        
    }
}

struct Form_Section_Background_Images_SwiftUI4: View {

    var body: some View {
        
        Form {
            Section {
                Text("List Row Background")
                    .foregroundColor(.gray)
                Text("Image work a little differently as you can see here.")
                Text("The image is actually set on a row in the second section.")
            } header: {
                Text("Form")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
        .onAppear {
            // FIXME:  I don't know how to to..., List rewrited in SwiftUI4
            UITableView.appearance().backgroundView = UIImageView(image: UIImage(named: "wallpaper"))
        }
    }
}

struct Form_Section_List_Row_Inset: View {
    var body: some View {
        Form {
            Section {
                Text("List Row Inset")
                    .foregroundColor(.gray)
                Text("You can use the listRowInsets modifier to adjust the indentation:")
                    .foregroundColor(.white)
                    .listRowBackground(Color.purple)
                
                Text("Indent Level 1")
                    .listRowInsets(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                Text("Indent Level 2")
                    .listRowInsets(EdgeInsets(top: 0, leading: 80, bottom: 0, trailing: 0))
                
                
                Text("Or Vertical Alignment")
                    .foregroundColor(.white)
                    .listRowBackground(Color.purple)
                
                // FIXME: No Work in SwiftUI 4!
                Text("Top")
                    .listRowInsets(EdgeInsets(top: -20, leading: 40, bottom: 0, trailing: 0))
                
                Text("bottom")
                    .listRowInsets(EdgeInsets(top: 20, leading: 40, bottom: 0, trailing: 0))
            } header: {
                Text("Form")
                    .font(.title)
                    .foregroundColor(.gray)
            }
        }
        .font(.title2)
    }
}

struct Form_Section_With_Controls: View {
    @State private var isOn = true
    @State private var textFieldData = "This is a text field"
    
    var body: some View {
        Form {
            Section {
                Text("This will give you an idea of how different controls are rendered in a Form.")
                    .foregroundColor(.white)
                    .listRowBackground(Color.purple)
            } header: {
                Text("Controls in a form")
                    .font(.title)
                    .foregroundColor(Color.gray)
            }
            
            Section {
                Button(action: {}) { Text("Button") }
                Toggle(isOn: $isOn) { Text("Toggle") }
                Stepper(onIncrement: {}, onDecrement: {}) {
                    Text("Stepper")
                }
                TextField("", text: $textFieldData)
                    .textFieldStyle(.roundedBorder)
            }
            Image(systemName: "leaf.arrow.circlepath").font(.title)
            Circle()
                .frame(height: 30)
            Text("Notice shapes are centered 👆.Not work in SwiftUI 4") // FIXME: Not work in SwiftUI 4
        }
        .font(.title)
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
//        Form_Section_List_Row_Background()
//        Form_Section_Background_Images()
//        Form_Section_Background_Images_SwiftUI4()
//        Form_Section_List_Row_Inset()
        Form_Section_With_Controls()
    }
}
