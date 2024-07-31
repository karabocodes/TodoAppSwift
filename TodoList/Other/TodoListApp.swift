//
//  TodoListApp.swift
//  TodoList
//
//  Created by Nagarro on 2024/07/03.
//
import FirebaseCore
import SwiftUI

@main
struct TodoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    
    @StateObject var viewModel = TodoListViewModel()
        
        var body: some Scene {
            WindowGroup {
                TodoListView()
                    .environmentObject(viewModel)
            }
        }
}
