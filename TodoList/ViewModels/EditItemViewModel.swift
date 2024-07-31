//
//  EditItemViewModel.swift
//  TodoList
//
//  Created by Nagarro on 2024/07/31.
//

import Foundation

class EditItemViewModel: ObservableObject {
    @Published var title: String
    @Published var description: String
    @Published var dueDate: Date
    @Published var priority: String
    @Published var showAlert: Bool = false
    
    var item: ToDoListItem
    
    init(item: ToDoListItem) {
        self.item = item
        self.title = item.title
        self.description = item.description
        self.dueDate = Date(timeIntervalSince1970: item.dueDate)
        self.priority = item.priority
    }
    
    var canSave: Bool {
        !title.isEmpty && !description.isEmpty
    }
    
    func save() {
        let updatedItem = ToDoListItem(
            id: item.id,
            title: title,
            description: description,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: item.createdDate,
            isDone: item.isDone,
            priority: priority
        )
        
        // Assume ToDoListItemViewModel is accessible here
        let viewModel = ToDoListItemViewModel()
        viewModel.updateItem(updatedItem)
    }
}
