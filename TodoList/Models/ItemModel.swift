//
//  ItemModel.swift
//  TodoList
//
//  Created by Никитка on 28.01.2022.
//

import Foundation

struct Item: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
