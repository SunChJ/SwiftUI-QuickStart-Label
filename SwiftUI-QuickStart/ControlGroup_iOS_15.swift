//
//  ControlGroup_iOS_15.swift
//  SwiftUI-QuickStart
//
//  Created by SamsonCJ on 2022/6/12.
//

import SwiftUI

struct ControlGroup_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("ControlGroup - iOS 15",
                       subtitle: "Introduction",
                       desc: "Use a ControlGroup view to group up related controls",
                       back: .brown,
                       textColor: .white)
            
            ControlGroup {
                Button("Hello!") {}
                Button(action: {}) {
                    Image(systemName: "gearshape.fill")
                }
            }
            
            DescView(desc: "You can change the default style to 'navigation':",
                     back: .brown,
                     textColor: .white)
            
            ControlGroup {
                Button("Hello!") {}
                Button(action: {}) {
                    Image(systemName: "gearshape.fill")
                }
            }
            .controlGroupStyle(.navigation)
        }
        .font(.title)
    }
}

struct ControlGroup_Previews: PreviewProvider {
    static var previews: some View {
        ControlGroup_Intro()
    }
}
