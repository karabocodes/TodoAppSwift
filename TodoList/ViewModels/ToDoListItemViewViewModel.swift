//
//  ToDoListItemViewViewModel.swift
//  TodoList
//
//  Created by Nagarro on 2024/07/08.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class ToDoListItemViewModel: ObservableObject {
    @Published var items: [ToDoListItem] = []
        private let db = Firestore.firestore()
        private var userId: String {
            Auth.auth().currentUser?.uid ?? ""
        }
        
        init() {
            loadTasks()
        }
        
        func loadTasks() {
            db.collection("users").document(userId).collection("todos")
                .addSnapshotListener { querySnapshot, error in
                    guard let documents = querySnapshot?.documents else {
                        print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
                        return
                    }
                    
                    self.items = documents.compactMap { queryDocumentSnapshot -> ToDoListItem? in
                        try? queryDocumentSnapshot.data(as: ToDoListItem.self)
                    }
                }
        }
        
        func addItem(_ item: ToDoListItem) {
            do {
                _ = try db.collection("users").document(userId).collection("todos").addDocument(from: item)
            } catch {
                print("Error adding document: \(error.localizedDescription)")
            }
        }
        
        func updateItem(_ item: ToDoListItem) {
            if let id = item.id {
                do {
                    try db.collection("users").document(userId).collection("todos").document(id).setData(from: item)
                } catch {
                    print("Error updating document: \(error.localizedDescription)")
                }
            }
        }
        
        func deleteItem(_ id: String) {
            db.collection("users").document(userId).collection("todos").document(id).delete() { error in
                if let error = error {
                    print("Error removing document: \(error.localizedDescription)")
                }
            }
        }
}
