//
//  ProfileViewModel.swift
//  TodoList
//
//  Created by Nagarro on 2024/07/08.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewModel: ObservableObject{
    init () {}
    @Published var user: User? = nil
    
    func fecthuUser(){
        
        //optional chain
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument{[weak self] snapshot, error in
        guard let data = snapshot?.data(), error == nil else {
            return
        }
        
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String  ?? "",
                    joined: data["Joined"] as? TimeInterval ?? 0
                )
            }
        }
    }
    
    func logOut(){
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}