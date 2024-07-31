////
////  NetworkManager.swift
////  TodoList
////
////  Created by Nagarro on 2024/07/26.
////
//import Foundation
//
//class NetworkManager {
//    static let shared = NetworkManager()
//    let baseURL = "https://api.example.com/todos" // Replace with actual URL
//    
//    private init() {}
//    
//    func getTodos(completion: @escaping (Result<[Todo], Error>) -> Void) {
//        guard let url = URL(string: baseURL) else { return }
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            
//            guard let data = data else { return }
//            
//            do {
//                let todos = try JSONDecoder().decode([ToDoListItem].self, from: data)
//                completion(.success(todos))
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
//    
//    func createTodo(task: String, completion: @escaping (Result<ToDoListItem, Error>) -> Void) {
//        guard let url = URL(string: baseURL) else { return }
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        let todo = Todo(id: nil, task: task, completed: false)
//        
//        do {
//            let jsonData = try JSONEncoder().encode(todo)
//            request.httpBody = jsonData
//            
//            URLSession.shared.dataTask(with: request) { data, response, error in
//                if let error = error {
//                    completion(.failure(error))
//                    return
//                }
//                
//                guard let data = data else { return }
//                
//                do {
//                    let createdTodo = try JSONDecoder().decode(Todo.self, from: data)
//                    completion(.success(createdTodo))
//                } catch {
//                    completion(.failure(error))
//                }
//            }.resume()
//        } catch {
//            completion(.failure(error))
//        }
//    }
//    
//    // Add update and delete methods similarly...
//}
