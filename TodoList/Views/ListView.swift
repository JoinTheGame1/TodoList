//
//  ListView.swift
//  TodoList
//
//  Created by Никитка on 28.01.2022.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity
                                    .animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
                .navigationBarItems(
                    leading: EditButton(),
                    trailing:
                        NavigationLink("Add", destination: AddView())
                    )
            }
            
        }
        .navigationTitle("Todo List 📝")
        .font(.headline)
    }
}
