//
//  ToDoListItemView.swift
//  TodoList
//
//  Created by Nagarro on 2024/07/04.
//
import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .bold()
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Due: \(formattedDate(item.dueDate))")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("Priority: \(item.priority)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Button(action: {
                // Show edit view
            }) {
                Image(systemName: "pencil")
            }
            Button(action: {
                viewModel.deleteItem(item.id)
            }) {
                Image(systemName: "trash")
            }
        }
    }
    
    private func formattedDate(_ interval: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: interval)
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}
