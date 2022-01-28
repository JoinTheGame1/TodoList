//
//  ListView.swift
//  TodoList
//
//  Created by Никитка on 28.01.2022.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [Item] = [
        Item(title: "This is the first", isCompleted: false),
        Item(title: "This is the second", isCompleted: true),
        Item(title: "Third", isCompleted: false)
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}
