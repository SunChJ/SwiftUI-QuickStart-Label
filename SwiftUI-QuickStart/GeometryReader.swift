//
//  GeometryReader.swift
//  SwiftUI-QuickStart
//
//  Created by SamsonCJ on 2022/6/12.
//

import SwiftUI

struct GeometryReader_Introduction: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("GeometryReader",
                       subtitle: "Introduction",
                       desc: "GeometryReader is a container view that pushes out to fill up all available space. You use it to help with postioning items within it.",
                       back: .clear)
            GeometryReader { _ in
                // No child views inside
            }
            .background(Color.pink) // safe areas bottom?
        }
        .font(.title)
    }
}

struct GeometryReader_Alignment: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("GeometryReader",
                       subtitle: "Alignment",
                       desc: "Child views within the GeometryReader are aligned in the upper left corner by default.",
                       back: .clear)
            GeometryReader { _ in
                // No child views inside
                Image(systemName: "arrow.up.left")
                    .padding()
            }
            .background(Color.pink)
            .foregroundColor(.white)
        }
        .font(.title)
    }
}

struct GeometryReader_Layers: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("GeometryReader",
                       subtitle: "Layers",
                       desc: "The child views within a GeometryReader will stack on top of each other, musch like a ZStack",
                       back: .clear)
            GeometryReader { _ in
                Image(systemName: "18.circle").padding()
                Image(systemName: "20.square").padding()
                Image(systemName: "1850.circle").padding()
            }
            .font(.largeTitle)
            .foregroundColor(.white)
            .background(Color.pink)
        }
        .font(.title)
    }
}

struct GeometryReader_Getting_Size: View {
    var body: some View {
        VStack(spacing: 10) {
            HeaderView("GeometryReader",
                       subtitle: "Getting Size",
                       desc: "Use the geometry reader when you need to get the height and/or  width of a space.",
                       back: .clear)
            GeometryReader { geometryProxy in
                VStack(spacing: 10) {
                    Text("Width: \(geometryProxy.size.width)")
                    Text("Height: \(geometryProxy.size.height)")
                }
                .padding()
                .foregroundColor(.white)
            }
            .background(Color.pink)
        }
        .font(.title)
    }
}

struct GeometryReader_Positioning: View {
    var body: some View {
        VStack(spacing: 10) {
            HeaderView("GeometryReader",
                       subtitle: "Positioning",
                       desc: "Use the GemotryProxy input parameter to help position child views at different locations within the gemotry's view.",
                       back: .clear)
            
            GeometryReader { geometryProxy in
                Text("Upper Left")
                    .font(.title)
                    .foregroundColor(.white)
                    .position(x: geometryProxy.size.width/5,
                              y: geometryProxy.size.height/10)
                
                Text("Lower Right")
                    .font(.title)
                    .foregroundColor(.white)
                    .position(x: geometryProxy.size.width - 90,
                              y: geometryProxy.size.height - 40)
            }
            .background(Color.pink)
            
            Text("Note: The position modifier uses the view's center point when setting the X and Y parameters.")
                .font(.title)
        }
        .font(.title)
    }
}

struct GeometryReader_Coordinates: View {
    var body: some View {
        VStack(spacing: 10) {
            HeaderView("GeometryReader",
                       subtitle: "Getting Coordinates",
                       desc: "Getting the coordinates (x,  y) of a geometry view is little different. Take a look at this example:",
                       back: .clear)
            
            GeometryReader { geometryProxy in
                VStack(spacing: 10) {
                    Text("X: \(geometryProxy.frame(in: CoordinateSpace.local).origin.x)")
                    Text("Y: \(geometryProxy.frame(in: CoordinateSpace.local).origin.y)")
                }.foregroundColor(.white)
            }
            .background(Color.pink)
            
            Text("The local coordinate will always give you zeros.")
            Text("You need to look globally to get the coordinates inside the current view:")
                
            GeometryReader { geometryProxy in
                VStack(spacing: 10) {
                    Text("X: \(geometryProxy.frame(in: .global).origin.x)")
                    Text("Y: \(geometryProxy.frame(in: .global).origin.y)")
                }.foregroundColor(.white)
            }
            .background(Color.pink)
            .frame(height: 200)
        }
        .font(.title)
        .padding([.horizontal])
    }
}

struct GeometryReader_Min_Mid_Max_Coordinates: View {
    var body: some View {
        VStack(spacing: 10) {
            HeaderView("GeometryReader",
                       subtitle: "Min Mid Max",
                       desc: "You can also get the minimum (min), middle (mid),and maximum (max) X and Y coordinate from the geometry redaer's frame.",
                       back: .clear)
            
            GeometryReader { geometry in
                VStack(alignment: .leading,spacing: 20) {
                    Text("Local Coordinate Space")
                    HStack(spacing: 10) {
                        // I'm convering to Int just so we don't have so many zeros
                        Text("minX: \(Int(geometry.frame(in: .local).minX))")
                        Spacer()
                        Text("midX: \(Int(geometry.frame(in: .local).midX))")
                        Spacer()
                        Text("maxX: \(Int(geometry.frame(in: .local).maxX))")
                    }
                    
                    Text("Global Coordinate Space")
                    HStack(spacing: 10) {
                        // I'm convering to Int just so we don't have so many zeros
                        Text("minX: \(Int(geometry.frame(in: .global).minX))")
                        Spacer()
                        Text("midX: \(Int(geometry.frame(in: .global).midX))")
                        Spacer()
                        Text("maxX: \(Int(geometry.frame(in: .global).maxX))")
                    }
                }
                .padding(.horizontal)
            }
            .frame(height: 200)
            .foregroundColor(.white)
            .background(Color.pink)
            
            HStack {
                GeometryReader { geometry in
                    VStack(spacing: 10) {
                        Text("minX: \(Int(geometry.frame(in: .global).minX))")
                        Spacer()
                        Text("midX: \(Int(geometry.frame(in: .global).midX))")
                        Spacer()
                        Text("maxX: \(Int(geometry.frame(in: .global).maxX))")
                    }.padding(.vertical)
                }
                .foregroundColor(.white)
                .background(.pink)
                
                Image("SwiftUI")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .font(.title)
        .padding()
    }
}

struct GeometryReader_Safe_Area_Insets: View {
    var body: some View {
        VStack {
            HeaderView("GeometryReader",
                       subtitle: "Min Mid Max",
                       desc: "You can also get the minimum (min), middle (mid),and maximum (max) X and Y coordinate from the geometry redaer's frame.",
                       back: .clear)
            
            GeometryReader { geometry in
                VStack {
                    Text("geometryProxy.safeAreaInsets.leading: \(geometry.safeAreaInsets.leading)")
                    Text("geometryProxy.safeAreaInsets.trailing: \(geometry.safeAreaInsets.trailing)")
                    Text("geometryProxy.safeAreaInsets.top: \(geometry.safeAreaInsets.top)")
                    Text("geometryProxy.safeAreaInsets.bottom: \(geometry.safeAreaInsets.bottom)")
                }
                .padding()
            }
            .border(Color.orange)
            .background(.pink)
            .foregroundColor(.white)
            
        }
        
        .font(.title)
    }
}

struct GeometryReader_Previews: PreviewProvider {
    static var previews: some View {
//        GeometryReader_Introduction()
//        GeometryReader_Alignment()
//        GeometryReader_Layers()
//        GeometryReader_Getting_Size()
//        GeometryReader_Positioning()
//        GeometryReader_Coordinates()
//        GeometryReader_Min_Mid_Max_Coordinates()
//            .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
        
        GeometryReader_Safe_Area_Insets()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
