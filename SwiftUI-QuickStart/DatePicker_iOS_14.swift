//
//  DatePicker_iOS_14.swift
//  SwiftUI-QuickStart
//
//  Created by SamsonCJ on 2022/6/12.
//

import SwiftUI

struct DatePicker_Intro: View {
    @State private var date = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("DatePicker",
                       subtitle: "Introduction",
                       desc: "The DatePicker will just show a date that can be tapped on like a button. You can add an optional label to it", back: .green)
            
            Text("Default style pulls in:")
            
            DatePicker("Today", selection: $date, displayedComponents: .date)
                .labelsHidden() // Hiding the label makes this view pull in.
                .padding(.horizontal)
            
            Text("With label: ")
            DatePicker("Today", selection: $date, displayedComponents: .date)
                .padding(.horizontal)
        }.font(.title)
    }
}

struct DatePicker_Styles: View {
    @State private var date = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("DatePicker",
                       subtitle: "Styles",
                       desc: "Graphical Style", back: .green)
            
            /*
             -- For datePickerStyle, use: --
             
             < iOS 15    :   GraphicalDatePickerStyle() | WheelDatePickerStyle()
             iOS 15+    :   .graphical | .wheel
             
             */
            
            DatePicker("Birthday", selection: $date, displayedComponents: .date)
                .datePickerStyle(.graphical)
                .frame(width: 320)
            
            DescView(desc: "Wheel Style", back: .green)
            
            DatePicker("Birthday", selection: $date, displayedComponents: .date)
                .datePickerStyle(.wheel)
                .labelsHidden()
            
        }.font(.title)
    }
}

struct DatePicker_Displayed_Components: View {
    @State private var date = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("DatePicker - iOS 14+", subtitle: "Displayed Components", desc: "You can show more than just a date. You can also show just the time or a combination of date and time", back: .green)
            
            DatePicker("Today", selection: $date, displayedComponents: .hourAndMinute)
                .labelsHidden()
                .padding(.horizontal)
            
            DatePicker("Today", selection: $date, displayedComponents: [.hourAndMinute, .date]) // Cool!
                .labelsHidden()
                .padding(.horizontal)
//                .buttonStyle(.bordered)
        }.font(.title)
    }
}

struct DatePicker_Displayed_In_Form: View {
    @State private var date = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("DatePicker - iOS 14+", subtitle: "Used in a Form", desc: "When used in a form, the date picker use the compact styling by default", back: .green)
            
            Form {
                DatePicker("Today", selection: $date, displayedComponents: .date)
                
                Section {
                    Text("Graphical Picker Style:")
                    DatePicker("Birthday", selection: $date, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                }
            }
            

        }.font(.title)
    }
}

struct DatePicker_Customizing: View {
    @State private var date = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("DatePicker - iOS 14+", subtitle: "Customizing", desc: "Customize the background and accent color:", back: .green)
            
            DatePicker("Birthday", selection: $date, displayedComponents: .date)
                .datePickerStyle(.graphical)
                .accentColor(.green)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.green)
                        .opacity(0.1)
                        .shadow(radius: 1, x: 4, y: 4)
                )
                .padding(.horizontal)
            
            DatePicker("Today", selection: $date, displayedComponents: .date)
                .frame(height: 50)
                .padding()
                .background(
                    Rectangle()
                        .fill(.green)
                        .shadow(radius: 4)
                        .opacity(0.2)
                )

        }.font(.title)
    }
}

struct DatePicker_Custom_Selector: View {
    @State private var date = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("DatePicker - iOS 14+", subtitle: "Custom Selector", desc: "At this time we can not customize the color of the text or background. Here are some other options though.", back: .green)
            
            DatePicker("Today", selection: $date, displayedComponents: .date)
                .labelsHidden()
            
                .background(
                    // cornerRadius of 8 and a continuous corner style is the best, I could get to match the existing gray background.
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(.green)
                        .opacity(0.2)
        
                )
            
            DescView(desc: "What does NOT work:", back: .green)
            
            Form {
                DatePicker("accentColor", selection: $date, displayedComponents: .date)
                    .accentColor(.green)
                
                DatePicker("foregroundColor", selection: $date, displayedComponents: .date)
                    .foregroundColor(.green)
                
                DatePicker("foregroundStyle", selection: $date, displayedComponents: .date)
                    .foregroundStyle(.green, .green, .green) // foregroundStyle<S1, S2, S3>(_ primary: S1, _ secondary: S2, _ tertiary: S3)
                
                DatePicker("Tint", selection: $date, displayedComponents: .date)
                    .tint(.green)
                
                DatePicker("accentColor & foregroundColor", selection: $date, displayedComponents: .date)
                    .accentColor(.green)
                    .foregroundColor(.green)
                
                DatePicker("accentColor & foregroundColor & background", selection: $date, displayedComponents: .date)
                    .accentColor(.green)
                    .foregroundColor(.green)
                    
                    .background(
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(.green)
                            .opacity(0.2)
                    ) // Sad....
                
            }.font(.body)

        }.font(.title)
    }
}

struct DatePicker_iOS_14_Previews: PreviewProvider {
    static var previews: some View {
//        DatePicker_Intro()
//        DatePicker_Styles()
//        DatePicker_Displayed_Components()
//        DatePicker_Displayed_In_Form()
//        DatePicker_Customizing()
        DatePicker_Custom_Selector()
    }
}
