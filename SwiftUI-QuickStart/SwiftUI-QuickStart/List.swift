//
//  List.swift
//  SwiftUI-QuickStart
//
//  Created by SamsonCJ on 2022/6/13.
//

import SwiftUI

struct List_With_StaticViews: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("List").font(.largeTitle)
            Text("Static Data").font(.title).foregroundColor(.gray)
            Text("You can show static views or data within the List view. It dose not have to be bound with data. It gives you a scrollable view.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.green)
                .foregroundColor(.black)
            
            List {
                Text("Line One")
                Text("Line Two")
                Text("Line Three")
                Image(systemName: "brain.head.profile")
                
                Button("Click Here", action: {})
                    .foregroundColor(.green)
                HStack {
                    Spacer()
                    Text("Centered Text")
                    Spacer()
                }.padding()
            }
            .font(.title)
        }
    }
}

struct List_With_Data: View {
    var stringArray = ["This is the simplest List",
                       "Evans", "Lemuel James Guerrero",
                       "Mark",
                       "Durtschi",
                       "Chase",
                       "Adam",
                       "Rodrigo",
                       "Notice the automatic wrapping when the text is longer"]
    
    var body: some View {
        List(stringArray, id: \.self) { string in
            Text(string)
        }
        .font(.largeTitle)
    }
}

struct List_Custom_Rows: View {
    var data = ["Custom Rows!", "Evans", "Lemuel James Guerrero", "Mark", "Durtschi", "Chase", "Adam", "Rodrigo"]
    // How to change List background?
    var body: some View {
        List(data, id:\.self) { datum in
            CustomRow(content: datum)
                
        }
        .accentColor(.purple)
        
        
    }
}

struct List_Move_Row: View {
    @State var data = ["Hit the Edit button to reorder", "Practice Coding", "Grocery shopping", "Get tickets", "Clean house", "Do laundry", "Cook dinner", "Paint room"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data, id:\.self) { datum in
                    Text(datum).font(Font.system(size: 24)).padding()
                }
                .onMove { source, destination in
                    data.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationTitle("To Do")
            .toolbar {
                ToolbarItem { EditButton() }
            }
        }
        .tint(.green)
    }
}

struct List_Delete_Row: View {
    @State var data = ["Swipe to Delete", "Practice Coding", "Grocery shopping", "Get tickets", "Clean house", "Do laundry", "Cook dinner", "Paint room"]
    
    var body: some View {
        List {
            Section {
                ForEach(data, id: \.self) { datum in
                    Text(datum).font(Font.system(size: 24)).padding()
                }
                .onDelete { offsets in
                    data.remove(atOffsets: offsets)
                }
            } header: {
                Text("To Do")
                    .padding()
            }
        }
    }
}

struct List_Selection_Single: View {
    @State private var data = ["Praction Coding", "Grocery shopping", "Get tickets", "Clean house", "Do laundry", "Cook dinner", "Paint room"]
    
    @State private var selection: String?
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HeaderView("", subtitle: "Selecting a Row", desc: "Use the selection parameter in List and supply a @State property to hold the selection.", back: .brown.opacity(0.7), textColor: .white)
                
                List(data, id: \.self, selection: $selection) { item in
                    HStack(spacing: 20) {
                        Text(item)
                    }
                } // NO CHECK in SwiftUI 4
            }
            .font(.title)
            .navigationTitle("List")
            .toolbar { EditButton() }
        }
    }
}

struct List_Selection_Multiple: View {
    @State private var data = ["Praction Coding", "Grocery shopping", "Get tickets", "Clean house", "Do laundry", "Cook dinner", "Paint room"]
    @State private var selections = Set<String>()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HeaderView("", subtitle: "Selecting Multiple Rows", desc: "Change your @State property to hold a Set of values.", back: .brown.opacity(0.7), textColor: .white)
                
                List(data, id: \.self, selection: $selections) { item in
                    Text(item)
                } // NO CHECK in SwiftUI 4
            }
            .font(.title)
            .navigationTitle("List")
            .toolbar { EditButton() }
        }
    }
}

struct Todo: Identifiable {
    let id = UUID()
    var action = ""
    var due = ""
    var isIndented = false
}

struct List_Row_Background: View {
    @State private var newTodo = ""
    
    @State var data = [
        Todo(action: "Practice Coding", due: "Today"),
        Todo(action: "Grocery shopping", due: "Today"),
        Todo(action: "Get tickets", due: "Tomorrow"),
        Todo(action: "Clean house", due: "Next Week"),
        Todo(action: "Do laundry", due: "Next Week"),
        Todo(action: "Cook dinner", due: "Next Week"),
        Todo(action: "Paint room", due: "Next Week")
    ]
    
    var body: some View {
        List {
            Section {
                ForEach(data) { datum in
                    Text(datum.action)
                        .font(.system(size: 24))
                        .foregroundColor(self.getTextColor(due: datum.due))
                        .listRowBackground(datum.due == "Today" ? Color.green : Color.clear)
                        .padding()
                }
            } header: {
                VStack {
                    Text("To Do").font(.title)
                    HStack {
                        TextField("new todo", text: $newTodo)
                            .textFieldStyle(.roundedBorder)
                        Button(action: {
                            data.append(Todo(action: newTodo))
                            newTodo = ""
                        }) {
                            Image(systemName: "plus.circle.fill").font(.title)
                        }
                    }
                }
                .padding(.bottom)
            }
        }
        .listStyle(.plain)
    }
    
    private func getTextColor(due: String) -> Color {
        due == "Today" ? Color.black : Color.primary
    }
}

struct List_Row_Inset: View {
    @State private var newTodo = ""
    
    @State var data = [
        Todo(action: "Practice Coding", due: "Today"),
        Todo(action: "Grocery shopping", due: "Today"),
        Todo(action: "Get tickets", due: "Tomorrow"),
        Todo(action: "Clean house", due: "Next Week"),
        Todo(action: "Do laundry", due: "Next Week"),
        Todo(action: "Cook dinner", due: "Next Week"),
        Todo(action: "Paint room", due: "Next Week")
    ]
    
    var body: some View {
        VStack {
            VStack {
                Text("To Do").font(.title).foregroundColor(.black)
                HStack {
                    TextField("new todo", text: $newTodo)
                        .textFieldStyle(.roundedBorder)
                    Button(action: {
                        data.append(Todo(action: newTodo))
                        newTodo = ""
                    }) {
                        Image(systemName: "plus.circle.fill").font(.title)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding()
            .background(Color.green)
            
            List {
                ForEach(data) { datum in
                    Text(datum.action)
                        .font(.title)
                        .padding()
                        .listRowInsets(EdgeInsets(top: 0, leading: datum.isIndented ? 60 : 20, bottom: 0, trailing: 0))
                }
            }
            .listStyle(.plain)

        }
        .listStyle(.plain)
    }
    
}

struct CustomRow: View {
    var content: String
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
            Text(content)
            Spacer(minLength: 5) // Should set minLength in SwiftUI 4
        }
        .foregroundColor(content == "Custom Rows!" ? Color.green : Color.primary)
        .font(.title)
        .padding([.top, .bottom])
        .background()
    }
}

struct List_Previews: PreviewProvider {
    static var previews: some View {
//        List_With_StaticViews().preferredColorScheme(.dark)
//        List_With_Data().preferredColorScheme(.dark)
        
//        List_Custom_Rows().preferredColorScheme(.dark)
//        List_Move_Row().preferredColorScheme(.dark)
//        List_Delete_Row().preferredColorScheme(.dark)
//        List_Selection_Single().preferredColorScheme(.dark)
//        List_Selection_Multiple().preferredColorScheme(.dark)
//        List_Row_Background().preferredColorScheme(.dark)
        List_Row_Inset().preferredColorScheme(.dark)
    }
}
