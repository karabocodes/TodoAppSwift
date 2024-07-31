//
//  NewItemViewModel.swift
//  TodoList
//
//  Created by Nagarro on 2024/07/08.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class NewItemViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var dueDate: Date = Date()
    @Published var priority: String = "Low"
    @Published var showAlert: Bool = false
    
    var canSave: Bool {
        !title.isEmpty && !description.isEmpty
    }
    
    func save() {
        let item = ToDoListItem(
            id: UUID().uuidString,
            title: title,
            description: description,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false,
            priority: priority
        )
        
        // Assume ToDoListItemViewModel is accessible here
        let viewModel = ToDoListItemViewModel()
        viewModel.addItem(item)
    }
}
