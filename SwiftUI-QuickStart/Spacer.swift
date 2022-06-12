//
//  Spacer.swift
//  SwiftUI-QuickStart
//
//  Created by SamsonCJ on 2022/6/12.
//

import SwiftUI

struct Spacer_Introducation: View {
    var body: some View {
        VStack {
            Text("Spacer")
                .font(.largeTitle)
            
            Text("Introduction")
                .foregroundColor(.gray)
            
            Text("Spacers push things away either verically or horizontally.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(.yellow)
                .foregroundColor(.black)
            
            Image(systemName: "arrow.up.circle.fill")
            Spacer()
            Image(systemName: "arrow.down.circle.fill")
            
            HStack {
                Text("Horization Spcaer")
                
                Image(systemName: "arrow.left.circle.fill")
                Spacer()
                Image(systemName: "arrow.right.circle.fill")
            }
            .padding([.horizontal])
            Color.yellow
                .frame(maxHeight: 50) // Height can decrease but not go higher than 50
        }
        .font(.title) // Apply this font to every view within the VStack
    }
}

struct Spacer_evenly_spaced: View {
    var body: some View {
        VStack {
            Text("Spacer")
                .font(.largeTitle)
            
            Text("Evenly Spaced")
                .foregroundColor(.gray)
            
            Text("Use Spacer to evenly space views horizontally so they look good on any device.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(.yellow)
                .foregroundColor(.black)
            
            Text("Before")
            HStack {
                VStack(alignment: .leading) {
                    Text("Names")
                        .font(.largeTitle)
                        .underline()
                    Text("Chase")
                    Text("Rodrigo")
                    Text("Mark")
                    Text("Evans")
                }
                
                VStack(alignment: .leading) {
                    Text("Color")
                        .font(.largeTitle)
                        .underline()
                    Text("Red")
                    Text("Orange")
                    Text("Green")
                    Text("Blue")
                }
            }
            
            Text("After")
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .foregroundColor(.black)
                .background(.yellow)
            
            HStack {
                
                HStack {
                    Spacer()
                       
                    VStack(alignment: .leading) {
                        Text("Names")
                            .font(.largeTitle)
                            .underline()
                        Text("Chase")
                        Text("Rodrigo")
                        Text("Mark")
                        Text("Evans")
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("Color")
                            .font(.largeTitle)
                            .underline()
                        Text("Red")
                        Text("Orange")
                        Text("Green")
                        Text("Blue")
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct Spacer_minimum_length: View {
    var body: some View {
        VStack {
            Text("Spacer")
                .font(.largeTitle)
            Text("Mnimum Length")
                .font(.title)
                .foregroundColor(.gray)
            Text("You can set a minimum space to exist between views using the minLength modifier on the Spacer.")
                .frame(maxWidth: .infinity)
                .font(.title)
                .padding()
                .background(.yellow)
                .foregroundColor(.black)
            
            Text("No minLength set (system default is used")
                .bold()
            
            HStack {
                Image("yosemite")
                Spacer()
                Text("This is Yosemite National Park").lineLimit(1)
            }.padding()
            
            Text("minLength = 0")
                .bold()
            HStack {
                Image("yosemite")
                Spacer(minLength: 0)
                Text("This is Yosemite National Park").lineLimit(1)
            }.padding()
            
            Text("minLength = 20")
                .bold()
            HStack {
                Image("yosemite")
                Spacer(minLength: 20)
                Text("This is Yosemite National Park").lineLimit(1)
            }.padding()
            
        }
    }
}

struct Spacer_relative_spacing_with_spacers: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Spacer").font(.largeTitle)
            Text("Mnimum Length").foregroundColor(.gray)
            Text("You can add more spacers to create relavtive spacing in comparison to other spacers.")
                .frame(maxWidth: .infinity).padding()
                .background(.yellow).foregroundColor(.black)
            
            HStack(spacing: 50) {
                VStack(spacing: 5) {
                    Spacer().frame(width: 5).background(.blue)
                    Text("33% Down")
                    Spacer().frame(width: 5).background(.blue)
                    Spacer().frame(width: 5).background(.blue)
                }
                
                VStack(spacing: 5) {
                    Spacer().frame(width: 5).background(.blue)
                    Spacer().frame(width: 5).background(.blue)
                    Spacer().frame(width: 5).background(.blue)
                    Text("75% Down")
                    Spacer().frame(width: 5).background(.blue)
                    
                }
            }
            
        }.font(.title)
    }
}

struct Spacer_Previews: PreviewProvider {
    static var previews: some View {
//        Spacer_Introducation().preferredColorScheme(.dark)
//        Spacer_evenly_spaced().preferredColorScheme(.dark)
//        Spacer_minimum_length().preferredColorScheme(.dark)
        
        Spacer_relative_spacing_with_spacers().preferredColorScheme(.dark)
    }
}
