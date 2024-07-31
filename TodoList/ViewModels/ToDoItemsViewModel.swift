//
//  ToDoItemsViewModel.swift
//  TodoList
//
//  Created by Nagarro on 2024/07/08.
//

import FirebaseFirestore
import Foundation

class ToDoItemsViewModel: ObservableObject{
    
    @Published var showingNewItemView = false
    
    private let userId: String
    init (userId: String) {
        self.userId = userId
    }
    //dselete to do lis t
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
