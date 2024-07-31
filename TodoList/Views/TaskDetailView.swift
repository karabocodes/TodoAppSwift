//
//  TaskDetailView.swift
//  TodoList
//
//  Created by Nagarro on 2024/07/31.
//

import SwiftUI
struct TaskDetailView: View {
    let item: ToDoListItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(item.title)
                .font(.title)
            
            Text("Description: \(item.description)")
                .font(.body)
            
            Text("Due Date: \(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                .font(.body)
            
            Text("Priority: \(item.priority)")
                .font(.body)
            
            Spacer()
            
            Button("Edit") {
                // Navigate to edit view
            }
            .padding()
            
            Button("Delete") {
                // Delete action
            }
            .padding()
            .foregroundColor(.red)
        }
        .padding()
    }
}
