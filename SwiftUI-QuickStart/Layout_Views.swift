//
//  Layout_Views.swift
//  SwiftUI-QuickStart
//
//  Created by SamsonCJ on 2022/6/12.
//

import SwiftUI

// MARK: VStack
struct VStack_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("VStack",
                       subtitle: "Introducation",
                       desc: "A Vstack will vertically arrange other views within it.",
                       back: .blue,
                       textColor: .white)
            
            Text("View 1")
            Text("View 2")
            Text("View 3")
            Text("View 4")
            Text("View 5")
            Text("View 6")
            Text("View 7")
            Text("View 8")
            /*
            // In SwiftUI, container views, like the VStack, can only contain up to 10 views.
            // But You can do that:
             
            // Text("View 9")
             
             VStack(spacing: 20) {
                 Text("View 9")
                 Text("View 10")
                 Text("View 11")
                 
             }
             */
            
            Text("View 9")
            /*
            Text("View 10") // Error: Extra argument in call
             */
            
        }.font(.title)
        
    }
    
}

struct VStack_Nesting: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("VStack",
                       subtitle: "Nesting",
                       desc: "A VStack can be nested within another VStack when laying out views",
                       back: .blue,
                       textColor: .white)
            
            VStack {
                Text("VStack inside another VSStack")
                Divider()
                Text("This can be helpful. Why?")
                Divider()
                Text("More than 10 views creates an error.")
            }
            
            .padding()
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.blue))
            .padding()
            
        }.font(.title)
    }
}

struct VStack_Spacing: View {
    var body: some View {
        VStack(spacing: 80) {
            Text("VStack")
                .font(.largeTitle)
            
            Text("Spacing")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("the VStack initializer allows you to set the spacing between all the views inside the VStack")
                .frame(maxWidth: .infinity)
                .font(.title)
                .padding()
                .background(.blue)
                .foregroundColor(.white)
            
            Image(systemName: "arrow.up.and.down.circle.fill")
                .font(.largeTitle)
            
            Text("The spacing here between all of these views is 80")
                .font(.title)
        }
        
    }
}

struct VStack_Alignment: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("VStack")
                .font(.largeTitle)
            Text("Alignment")
                .font(.title)
                .foregroundColor(.gray)
            Text("By default, views in a VStack are center aligned.")
                .frame(maxWidth: .infinity)
                .font(.title)
                .padding()
                .background(.blue)
                .foregroundColor(.white)

            VStack(alignment: .leading, spacing: 40) {
                Text("Leading Alignment")
                    .font(.title)
                Divider()
                Image(systemName: "arrow.left")
            }
            .padding()
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 10))
            .foregroundColor(.blue)
            .padding()
            
            VStack(alignment: .trailing, spacing: 40) {
                Text("Trailing Alignment")
                    .font(.title)
                Divider()
                Image(systemName: "arrow.right")
            }
            .padding()
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 10))
            .foregroundColor(.blue)
            .padding()
        }
    }
}


// MARK: HStack

struct HStack_Intro: View {
    var body: some View {
        VStack(spacing: 40) {
            HeaderView("HStack",
                       subtitle: "Introduction",
                       desc: "An HStack will horizontally arrange other views within it",
                       back: .orange)
            
            HStack {
                Text("View 1")
                Text("View 2")
                Text("View 3")
            }
            .font(.title)
        }
    }
}

struct HStack_Spacing: View {
    var body: some View {
        VStack(spacing: 40) {
            HeaderView("HStack",
                       subtitle: "Spacing",
                       desc: "The HStack initializer allows you to set the spacing between all the views inside the HStack",
                       back: .orange)
            
            Text("Default Spcaing")
                .font(.title)
            HStack {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }.font(.largeTitle)
            
            Divider()
            
            Text("Spacing: 100")
                .font(.title)
            HStack(spacing: 100) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }.font(.largeTitle)
        }
    }
}

struct HStack_Alignment: View {
    var body: some View {
        VStack(spacing: 40) {
            HeaderView("HStack",
                       subtitle: "Vertical Aligment",
                       desc: "By default, views within an HStack are vertically aligned in the center.",
                       back: .orange)
            
            HStack { // default aligment: .center
                Rectangle().foregroundColor(.orange).frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Center")
                Spacer()
                Text("Trailing")
                    .padding(.trailing)
            }
            .border(Color.orange)
            
            HStack(alignment: .top) {
                Rectangle().foregroundColor(.orange).frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Center")
                Spacer()
                Text("Trailing")
                    .padding(.trailing)
            }
            .border(Color.orange)
            
            HStack(alignment: .bottom) {
                Rectangle().foregroundColor(.orange).frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Center")
                Spacer()
                Text("Trailing")
                    .padding(.trailing)
            }
            .border(Color.orange)
        }
    }
}

struct HStack_TextAlignment: View {
    var body: some View {
        VStack(spacing: 40) {
            HeaderView("HStack",
                       subtitle: "Text Aligment",
                       desc: "HStack have another aligment option to help better align the bottom of text.",
                       back: .orange)
            HStack(alignment: .bottom) {
                Text("Hello")
                Text("amazing")
                    .font(.largeTitle)
                Text("developer!")
            }
            .font(.body) // can't override texts's font
            
            DescView(desc: "Notice the bottom of the text isn't really aligned above.Use firstTextBaseline or lastTextBaseline instead:", back: .orange)
            
            HStack(alignment: .firstTextBaseline) {
                Text("Hello")
                Text("amazing")
                    .font(.largeTitle)
                Text("developer!")
            }
            .font(.body) // can't override texts's font
            
        }.font(.title) // can't override texts's font
    }
}

struct HStack_TextAlignment_FirstLast: View {
    var body: some View {
        VStack(spacing: 40) {
            HeaderView("HStack",
                       subtitle: "First & Last Text Alignment",
                       desc: "The firstTextBaseline will align the bottom of the text on the first lines (\"Amazing\" and \"Really\").",
                       back: .orange)
            
            HStack(alignment: .firstTextBaseline) {
                Text("Amazing developer")
                    .font(.title3)
                Text("Really amazing devloper!")
            }
            .frame(width: 250)
            
            DescView(desc: "The lastTextBaseline will align the bottom of the text on the last lines (\"developer\" and \"developer\")", back: .orange)
            
            HStack(alignment: .lastTextBaseline) {
                Text("Amazing developer")
                    .font(.title3)
                Text("Really amazing devloper!")
            }
            .frame(width: 250)
            
        }.font(.title)
    }
}

struct HStack_Customization: View {
    var body: some View {
        VStack(spacing: 40) {
            HeaderView("HStack",
                       subtitle: "Customizing",
                       desc: "HStacks are views that can have modifers applied to them just like any other view.",
                       back: .orange)
            HStack {
                Text("Leading")
                Text("Middle")
                Text("Trailing")
            }
            .padding()
                .border(.orange) // Create a 2 point border using the color specified
            
            HStack(spacing: 10) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }.padding()
            
            HStack(spacing: 20) {
                Image(systemName: "a.circle.fill")
                Image(systemName: "b.circle.fill")
                Image(systemName: "c.circle.fill")
                Image(systemName: "d.circle.fill")
                Image(systemName: "e.circle.fill")
            }
            .font(.largeTitle).padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.orange) // currect code in Xcode 14
            }
            
        }.font(.title)
    }
}

struct HStack_Layout_Priority: View {
    var body: some View {
        VStack(spacing: 40) {
            HeaderView("HStack",
                       subtitle: "Layout Priority",
                       desc: "Use the layoutPriority modifer to give priority to the space a view needs to show its content.",
                       back: .orange)
            Text(".layoutPriority(1) is set on 'Brings Balance'")
                .font(.subheadline)
            
            HStack {
                Text("SwiftUI")
                    .font(.largeTitle).lineLimit(1) // Dont't let text wrap
                Image("SwiftUI")
                    .resizable()
                    .frame(width: 80, height: 80)
                Text("Brings Balance")
                    .font(.largeTitle)
                    .layoutPriority(1) // Truncate last
            }
            .padding([.horizontal])
            
            Divider()
            
            HStack {
                Text("SwiftUI")
                    .font(.largeTitle)
                    .layoutPriority(1) // Truncate last
                Image("SwiftUI")
                    .resizable()
                    .frame(width: 80, height: 80)
                Text("Brings Balance")
                    .font(.largeTitle)
                    .lineLimit(1) // Dont't let text wrap
            }
            .padding([.horizontal])
            
            
            Text(".layoutPriority(1) is set on 'SwiftUI'")
                .font(.subheadline)
            
        }.font(.title)
    }
}

struct DescView: View {
    @State var desc: String
    @State var back: Color
    @State var textColor: Color
    
    init(desc: String, back: Color, textColor: Color = .black) {
        self.desc = desc
        self.back = back
        self.textColor = textColor
    }
    
    var body: some View {
        Text(desc)
            .frame(maxWidth: .infinity)
            .font(.title)
            .foregroundColor(textColor)
            .padding() // Add space all around the text
            .background(back)
    }
}


struct Layout_Views_Previews: PreviewProvider {
    static var previews: some View {
//        VStack_Intro()
//        VStack_Nesting()
//        VStack_Spacing()
//        VStack_Alignment()
        
        
//        HStack_Intro().preferredColorScheme(.dark)
//        HStack_Spacing().preferredColorScheme(.dark)
//        HStack_Alignment().preferredColorScheme(.dark)
//        HStack_TextAlignment().preferredColorScheme(.dark)
//        HStack_TextAlignment_FirstLast().preferredColorScheme(.dark)
//        HStack_Customization().preferredColorScheme(.dark)
        HStack_Layout_Priority().preferredColorScheme(.dark)
    }
}
