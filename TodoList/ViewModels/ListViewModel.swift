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
 Save
 */

class ListViewModel: ObservableObject {
    
    @Published var items: [Item] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard let data = UserDefaults.standard.data(forKey: itemsKey),
              let savedItems = try? JSONDecoder().decode([Item].self, from: data)
        else { return }
        items = savedItems
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
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
