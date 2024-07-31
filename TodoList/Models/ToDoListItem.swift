//
//  ToDoListItem.swift
//  TodoList
//
//  Created by Nagarro on 2024/07/08.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    var priority: String
}
