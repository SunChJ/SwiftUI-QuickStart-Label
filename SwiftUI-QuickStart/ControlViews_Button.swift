//
//  ControlViews_Button.swift
//  SwiftUI-QuickStart
//
//  Created by SamsonCJ on 2022/6/12.
//

import SwiftUI

struct ControlViews_Button_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Button",
                       subtitle: "Introduction",
                       desc: "If you just want to show the default text style in a button then you can pass in a string as the first parrameter",
                       back: .purple,
                       textColor: .white)
            
            Button("Default Button Style") {
                // Your code here
            }
            
            DescView(desc: "You can customize the text shown for a button", back: .purple, textColor: .white)
            Button(action: {}) {
                Text("Healine Font")
                    .font(.headline)
            }
            
            Divider()
            Button(action: {}) {
                Text("Foreground Color")
                    .foregroundColor(.red)
            }
            Divider()
            Button(action: {}) {
                Text("Thin Font Weight")
                    .fontWeight(.thin)
            }
        }
        .font(.title)
    }
}

struct ControlViews_Button_Text_Composition: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Button",
                       subtitle: "Text Composition",
                       desc: "You can add more than one text view to a button. By default, the views are composed within an HStack.",
                       back: .purple,
                       textColor: .white)
            
            Button(action: {}) {
                Text("Forgot Password?")
                Text("Tap to Recover")
                    .foregroundColor(.orange)
            }
            
            DescView(desc: "Using a VStack", back: .purple, textColor: .white)
            
            Button(action: {}) {
                VStack {
                    Text("New User")
                    Text("(Register Here)").font(.body)
                }
            }
        }
        .font(.title)
    }
}

struct ControlViews_Button_With_Backgrounds: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Button",
                       subtitle: "With Background",
                       desc: "As with most views, we can also customize the background and a shadow.",
                       back: .purple,
                       textColor: .white)
            
            Button(action: {}) {
                Text("Solid Button")
                    .padding(12)
                    .foregroundColor(.white)
                    .background(.purple)
                    .cornerRadius(8)
                
            }
            
            Button(action: {}) {
                Text("Button With Shadow")
                    .padding(12)
                    .foregroundColor(.white)
                    .background(.purple)
                    .cornerRadius(8)
            }
            .shadow(color: .purple, radius: 20, y: 5)
            
            Button(action: {}) {
                Text("Button With Rounded Ends")
                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                    .foregroundColor(.white)
                    .background(.purple)
                    .cornerRadius(999) // A number higher than the height of the button will always give you a rounded ends.
            }
        }
        .font(.title)
    }
}

struct ControlViews_Button_With_Borders: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Button",
                       subtitle: "With Borders",
                       desc: "Applying borders can add a nice effect to your buttons. Here are some options.",
                       back: .purple,
                       textColor: .white)
            
            Button(action: {}) {
                Text("Square Border Button")
                    .padding()
                    .border(.purple)
            }
            
            Button(action: {}) {
                Text("Rounded Border Button")
                    .padding()
                    .border(.purple)
                    .cornerRadius(10)
            }
            
            DescView(desc: "Look what happened when I tried to add a corner radius to the border. It is clipping the corners. Here is a different way you can accomplish this:", back: .purple, textColor: .white)
            
            Button(action: {}) {
                Text("Border Button")
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.purple, lineWidth: 2)
                    }
            }
            
        }
        .font(.title)
    }
}

struct ControlViews_Button_With_SF_Symbols: View {
    var body: some View {
        VStack(spacing: 40) {
            HeaderView("Button",
                       subtitle: "With SF Symbols",
                       desc: "Buttons can be composed with SF Symbols too.",
                       back: .purple,
                       textColor: .white)
            
            Button(action: {}) {
                Text("Button With Symbol")
                    .padding(.horizontal)
                Image(systemName: "gift.fill")
            }
            .padding()
            .foregroundColor(.white)
            .background(.purple)
            .cornerRadius(8)
            
            Button(action: {}) {
                Image(systemName: "magnifyingglass")
                Text("Search")
                    .padding(.horizontal)
            }
            .padding()
            .foregroundColor(.white)
            .background(.purple)
            .cornerRadius(8)
            
            Button(action: {}) {
                VStack {
                    Image(systemName: "video.fill")
                    Text("Record")
                        .padding(.horizontal)
                }
            }
            .padding()
            .foregroundColor(.white)
            .background(.purple)
            .cornerRadius(.infinity)
            
        }
        .font(.title)
    }
}

struct ControlViews_Button_With_Images: View {
    var body: some View {
        VStack(spacing: 40) {
            HeaderView("Button", subtitle: "With Images", desc: "Button work fine with the SF Symbol. But what if you wanted to use a photo?", back: .purple, textColor: .white)
            
            Button(action: {}) {
                Image("yosemite")
                    .cornerRadius(40)
            }
            
        }
    }
    
}

struct ControlViews_Button_Floating_Action_Button: View {
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                
                Text("Button")
                    .font(.largeTitle)
                
                Text("Floating")
                    .font(.title).foregroundColor(.gray)
                
                DescView(desc: "You can also create floating buttons by using a ZStack so the button is on the top layer, over everything else", back: .purple, textColor: .white)
                
                Spacer()
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .font(.title)
                    }
                    .padding(20)
                    .foregroundColor(.white)
                    .background(.purple)
                    .cornerRadius(.infinity)
                }
                .padding(.trailing, 30) // Add 30 points on the trailing side of the botton
            }
            
        }
        
        
    }
}

// MARK: iOS 15 features:
struct ControlViews_Button_ButtonStyle: View {
    // NOTE: iOS 15
    var body: some View {
        VStack(spacing: 60) {
            HeaderView("Button", subtitle: "ButtonStyle", desc: "You can apply preset button styles to your button with the buttonStyle modifier", back: .yellow.opacity(0.7), textColor: .white)
            
            Button("Automatic") {}
                .buttonStyle(.automatic)
            
            Button("Bordered") {}
                .buttonStyle(.bordered)
            
            Button("BorderedProminent") {}
                .buttonStyle(.borderedProminent)
            
            Button("Borderless") {}
                .buttonStyle(.borderless)
            
            Button("Plain") {}
                .buttonStyle(.plain)
        }
        .font(.title)
        .accentColor(.purple)
    }
}

struct ControlViews_Button_ControlSize: View {
    // NOTE: iOS 15
    var body: some View {
        VStack(spacing: 60) {
            HeaderView("Button", subtitle: "ControlSize", desc: "use controlSize to change the amount of padding around the content of the button.", back: .yellow.opacity(0.7), textColor: .white)
            
            Button("Bordered - Mini") {}
                .buttonStyle(.bordered)
                .controlSize(.mini)
            
            Button("Bordered - Small") {}
                .buttonStyle(.bordered)
                .controlSize(.small)
            
            Button("Bordered - Regular") {}
                .buttonStyle(.bordered)
                .controlSize(.regular)
            
            Button("Bordered - Large") {}
                .buttonStyle(.bordered)
                .controlSize(.large)
            
            Button(action:{}) {
                // You can still change the size manually and the shape will be the same.
                Text("Bordered - Large")
                    .frame(maxWidth: .infinity)
    
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            
        }
        .font(.title)
        .accentColor(.purple)
    }
}

struct ControlViews_Button_Tint: View {
    // NOTE: iOS 15
    var body: some View {
        VStack(spacing: 60) {
            HeaderView("Button", subtitle: "Tint", desc: "Tint is a litte bit different than accentColor. The tint can affect button styles differently.", back: .yellow.opacity(0.7), textColor: .white)
            
            Button("Bordered - Accent") {}
                .buttonStyle(.bordered)
                .foregroundColor(.purple)
                
            
            Button("Bordered - Tint") {}
                .buttonStyle(.bordered)
                .tint(.purple)
            
            Button("Borderless - Tint") {}
                .buttonStyle(.borderless)
                .tint(.purple)
            
            Button("Alternative AccentColor") {}
                .buttonStyle(.borderless)
                .foregroundColor(.purple)
            
            Button("Deprecation AccentColor") {}
                .buttonStyle(.borderless)
                .accentColor(.purple) // The accentColor modifier will be deprecated. Instead use: .tint/.foregroundColor(Color.accentColor)
            
            Button(action:{}) {
                // You can still change the size manually and the shape will be the same.
                Text("Bordered - Large")
                    .frame(maxWidth: .infinity)
    
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            
        }
        .font(.title)
//        .accentColor(.purple)
        .controlSize(.large)
    }
}

struct ControlViews_Button_Role: View {
    // NOTE: iOS 15
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Button", subtitle: "Roler", desc: "Use the role parameter to specify the kind of button you have.", back: .yellow.opacity(0.7), textColor: .white)
            
            Button("Normal") {}
                .buttonStyle(.bordered)
            
            Button("Destructive", role: .destructive) {}
                .buttonStyle(.bordered)
            
            Button("Destructive", role: .destructive) {}
                .buttonStyle(.borderedProminent)
            
            Button("Cancel", role: .cancel) {}
                .buttonStyle(.bordered)
            
            Button("Cancel", role: .cancel) {}
                .buttonStyle(.borderedProminent)
            
        }
        .font(.title)
        .accentColor(.purple)
        .controlSize(.large)
    }
}

struct ControlViews_Button_ButtonBorderShape: View {
    // NOTE: iOS 15
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Button", subtitle: "ButtonBorderShape", desc: "Set a button's shape to capsule or rounded rectangle on bordered and bordered prominent buttons.", back: .yellow.opacity(0.7), textColor: .white)
            
            Button("Automatic") {}
                .buttonStyle(.bordered)
                .buttonBorderShape(.automatic)
                
            Button("Automatic") {}
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.automatic)
            
            Button("Capsule") {}
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
            
            Button("Capsule") {}
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
            
            Button("RoundedRectangle") {}
                .buttonStyle(.bordered)
                .buttonBorderShape(.roundedRectangle)
            
            Button("RoundedRectangle") {}
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle)
            
            Button("Set Radius") {}
                .buttonStyle(.bordered)
                .buttonBorderShape(.roundedRectangle(radius: 0))
            
        }
        .font(.title)
        .accentColor(.purple)
        
        .controlSize(.large)
    }
}

// MARK: ------ End ------

struct ControlViews_Button_Disable: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Button", subtitle: "Disable", desc: "Use the disable modifier to prevent the user from interacting with buttons.", back: .yellow.opacity(0.7), textColor: .white)
            
            Button("Enable") {}
            Button("Disable") {}
                .disabled(true)
            
            Button("Enable") {}
                .buttonStyle(.borderedProminent)
            Button("Disable") {}
                .buttonStyle(.borderedProminent)
                .disabled(true)
        }
        .font(.title)
        .controlSize(.large)
        .tint(.purple)
    }
}

struct ControlViews_Button_Previews: PreviewProvider {
    static var previews: some View {
        //        ControlViews_Button_Intro().preferredColorScheme(.dark)
        //        ControlViews_Button_Text_Composition().preferredColorScheme(.dark)
        //        ControlViews_Button_With_Backgrounds().preferredColorScheme(.dark)
        //        ControlViews_Button_With_Borders().preferredColorScheme(.dark)
        //        ControlViews_Button_With_SF_Symbols().preferredColorScheme(.dark)
        //        ControlViews_Button_With_Images().preferredColorScheme(.dark)
//        ControlViews_Button_Floating_Action_Button().preferredColorScheme(.dark)
//        ControlViews_Button_ButtonStyle().preferredColorScheme(.dark)
//        ControlViews_Button_ControlSize().preferredColorScheme(.dark)
//        ControlViews_Button_Tint().preferredColorScheme(.dark)
        
//        ControlViews_Button_Role().preferredColorScheme(.dark)
//        ControlViews_Button_ButtonBorderShape().preferredColorScheme(.dark)
        ControlViews_Button_Disable().preferredColorScheme(.dark)
    }
}
