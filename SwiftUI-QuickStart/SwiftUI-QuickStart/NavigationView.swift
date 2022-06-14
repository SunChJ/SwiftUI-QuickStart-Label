//
//  NavigationView.swift
//  SwiftUI-QuickStart
//
//  Created by SamsonCJ on 2022/6/14.
//

import SwiftUI

struct NavigationView_Intro: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("Theme3ForegroundColor")
                
                VStack(spacing: 25) {
                    Image(systemName: "globe")
                        .font(.largeTitle)
                    
                    HeaderView("NavigationView", subtitle: "Introduction", desc: "Having a NavigationView will show nothing unless you also inclue a navigationTitle modifier.", back: Color("Theme3ForegroundColor"), textColor: .black)
                    
                    Spacer()
                }
                .font(.title)
                .padding(.top, 25)
            }
            // Blow ZStack
            .navigationTitle("Naviation Views")
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct NavigationView_BackgroundColor: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("Theme3ForegroundColor")
                    .ignoresSafeArea() // Allows background color to go BEHIND large nav bar
                
                VStack(spacing: 25) {
                    Image(systemName: "globe")
                        .font(.largeTitle)
                    
                    HeaderView("NavigationView", subtitle: "BackgroundColor", desc: "With the large navigation bar, you can have a background color extend underneath it.", back: Color("Theme3ForegroundColor"), textColor: .black)
                    
                    Spacer()
                }
                .backgroundStyle(Color.clear)
                .font(.title)
                .padding(.top, 25)
            }
            .navigationTitle("Naviation Views")
        }
    }
}

struct NavigationView_DisplayMode: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("Theme3ForegroundColor")
                
                VStack(spacing: 25) {
                    Image(systemName: "globe")
                        .font(.largeTitle)
                    
                    HeaderView("NavigationView", subtitle: "Display Mode", desc: "For the navigation bar display mode, you can specify if you want it large or small (inline) or just automatic", back: Color("Theme3ForegroundColor"), textColor: .black)
                    
                    Spacer()
                }
                .font(.title)
                .padding(.top, 25)
            }
            .navigationTitle("Naviation Views")
            // Use .inline for the smaller nav bar
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct NavigationView_NavigationBarHidden: View {
    @State private var isHidden = true
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Theme3ForegroundColor")
                
                VStack(spacing: 25) {
                    Image(systemName: "globe").font(.largeTitle)
                    
                    HeaderView("NavigationView", subtitle: "Navigation Bar Hidden", desc: "If you don't want to show a navigation bar, you can use the navigationBarHidden modifier to hide it.", back: Color("Theme3ForegroundColor"), textColor: .black)
                    
                    Toggle("Hide Nav Bar", isOn: $isHidden)
                        .padding()
                    
                    Spacer()
                }
                .font(.title)
                .padding(.top, 25)
                .navigationTitle("Navigation Title")
            }
            .navigationBarHidden(isHidden)
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct NavigationView_BarIetms: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                Image(systemName: "globe").font(.largeTitle)
                
                HeaderView("NavigationView", subtitle: "Navigation Bar Items", desc: "You can add navigation bar buttons to the leading or trailing (or both) sides of a navigation bar.", back: Color("Theme3ForegroundColor"), textColor: .black)
                
                Spacer()
            }
            .font(.title)
            .padding(.top, 25)
            .navigationTitle("Navigation Bar Buttons")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "bell.fill")
                            .padding(.horizontal)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Actions", action: {})
                }
            }
            .tint(.pink)
        }
    }
}

struct NavigationView_BarBackButtonHidden: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("Theme3ForegroundColor")
                VStack(spacing: 25) {
                    Image(systemName: "globe").font(.largeTitle)
                    Text("NavigationView").font(.largeTitle)
                    Text("Back Button Hidden").foregroundColor(.gray)
                    Image(systemName: "arrow.backward.square.fill")
                    
                    NavigationLink("Go To Detail", destination: BackButtonHiddenDetail())
                    Spacer()
                }
                .font(.title)
                .padding(.top, 70)
            }
            .navigationTitle("Navigation Views")
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct BackButtonHiddenDetail: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color("Theme3ForegroundColor")
            VStack(spacing: 25) {
                Image(systemName: "globe").font(.largeTitle)
                Text("NavigationView").font(.largeTitle)
                Text("Back Button Hidden").foregroundColor(.gray)
                Image(systemName: "arrow.backward.square.fill")
                Text("This nav bar has no back button because it was hidden on this view.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("Theme3ForegroundColor"))
                    .foregroundColor(.black)
                
                Button("Go Back") {
                    dismiss()
                }
                
                Spacer()
            }
            .font(.title)
            .padding(.top, 50)
        }
        .navigationTitle("Detail View")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .bottom)
        // Hide the back button
        .navigationBarBackButtonHidden(true)
    }
}

struct NavigationView_CustomBackButton_Main: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("Theme3ForegroundColor")
                VStack(spacing: 25) {
                    Image(systemName: "globe").font(.largeTitle)
                    Text("NavigationView").font(.largeTitle)
                    Text("Back Button Hidden").foregroundColor(.gray)
                    Image(systemName: "arrow.backward.square.fill")
                    
                    NavigationLink("Go To Detail", destination: NavigationView_CustomBackButton())
                    Spacer()
                }
                .font(.title)
                .padding(.top, 70)
            }
            .navigationTitle("Navigation Views")
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct NavigationView_CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color("Theme3ForegroundColor")
            VStack(spacing: 25) {
                Image(systemName: "globe").font(.largeTitle)
                
                HeaderView("NavigationView", subtitle: "Custom Back Button", desc: "Hide The system back button and then use toolbar modifier to add a leading button.", back: Color("Theme3ForegroundColor"))
                
                Image(systemName: "arrow.backward.square.fill")
                Spacer()
            }
            .font(.title)
            .padding(.top, 50)
        }
        .navigationTitle("Detail View")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .bottom)
        // Hide the system back button
        .navigationBarBackButtonHidden(true)
        .toolbar {
            // should use .navigationBarLeading NOT .navigation
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left.circle")
                }
            }
        }
    }
}

struct NavigationView_MultipleViewWithin: View {
    var body: some View {
        NavigationView {
            // Sidebar
            List {
                Section {
                    Label("Learn Geography", systemImage: "signpost.right.fill")
                    Label("Learn Music", systemImage: "doc.richtext")
                    Label("Learn Photography", systemImage: "camera.aperture")
                    Label("Learn Art", systemImage: "paintpalette.fill")
                        .font(.system(.title3).weight(.bold))
                    Label("Learn Physics", systemImage: "atom")
                    Label("Learn 3D", systemImage: "cube.transparent")
                    Label("Learn Hair Styling", systemImage: "comb.fill")
                } header: {
                    Text("What would you like to learn?")
                } footer: {
                    Text("Count: 7")
                }
            }
            .listStyle(.sidebar)
            // Main View
            VStack(spacing: 20) {
                HeaderView("NavigationView", subtitle: "Sidebar view", desc: "In iPadOS you can add a three views with the first view becoming the sidebar.", back: .purple)
                Spacer()
            }
            .font(.title)
            
            // Detail View
            VStack {
                HStack {
                    Label("Learn Art", systemImage: "paintpalette.fill")
                    Spacer()
                }
                .padding()
                
                Spacer()
            }
        }
        .navigationTitle("Side Bar")
    }
}


struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
//        NavigationView_Intro()
//        NavigationView_BackgroundColor()
//        NavigationView_DisplayMode()
//        NavigationView_NavigationBarHidden()
//        NavigationView_BarIetms()
//        NavigationView_BarBackButtonHidden()
//        NavigationView_CustomBackButton_Main()
        NavigationView_MultipleViewWithin().previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)")).previewInterfaceOrientation(.landscapeLeft)
    }
}
