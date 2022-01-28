//
//  ListRowView.swift
//  TodoList
//
//  Created by Никитка on 28.01.2022.
//

import SwiftUI

struct ListRowView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}
