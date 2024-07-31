//
//  User.swift
//  TodoList
//
//  Created by Nagarro on 2024/07/08.
//

import Foundation


struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
