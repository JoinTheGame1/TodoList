//
//  ListViewModel.swift
//  TodoList
//
//  Created by Никитка on 28.01.2022.
//

import Foundation

/*
 FUNCTIONS
 
 Create
 Read
 Update
 Delete
 */

class ListViewModel: ObservableObject {
    
    @Published var items: [Item] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            Item(title: "This is the first", isCompleted: false),
            Item(title: "This is the second", isCompleted: true),
            Item(title: "Third", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = Item(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: Item) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
}
