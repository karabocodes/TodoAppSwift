//
//  TodoListItemsviews.swift
//  TodoList
//
//  Created by Nagarro on 2024/07/04.
//
import FirebaseFirestoreSwift
import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var viewModel: TodoListViewModel
    
    @State private var selectedSortOption: SortOption = .dueDate
    @State private var selectedFilterOption: FilterOption = .all
    @State private var showingNewItemView: Bool = false
    
    var sortedFilteredItems: [ToDoListItem] {
        var itemsToDisplay = viewModel.items
        
        // Apply filtering
        switch selectedFilterOption {
        case .completed:
            itemsToDisplay = itemsToDisplay.filter { $0.isDone }
        case .incomplete:
            itemsToDisplay = itemsToDisplay.filter { !$0.isDone }
        case .all:
            break
        }
        
        // Apply sorting
        switch selectedSortOption {
        case .dueDate:
            itemsToDisplay.sort { $0.dueDate < $1.dueDate }
        case .priority:
            itemsToDisplay.sort { $0.priority < $1.priority }
        }
        
        return itemsToDisplay
    }
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Picker("Sort by", selection: $selectedSortOption) {
                        Text("Due Date").tag(SortOption.dueDate)
                        Text("Priority").tag(SortOption.priority)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Picker("Filter", selection: $selectedFilterOption) {
                        Text("All").tag(FilterOption.all)
                        Text("Completed").tag(FilterOption.completed)
                        Text("Incomplete").tag(FilterOption.incomplete)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding()
                
                List(sortedFilteredItems) { item in
                                    NavigationLink(destination: TaskDetailView(item: item)) {
                                        ToDoListItemView(item: item)
                                    }
                                }
                                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button(action: {
                    showingNewItemView = true
                }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingNewItemView) {
                NewItemView(newItemPresented: $showingNewItemView)
            }
        }
    }
}

