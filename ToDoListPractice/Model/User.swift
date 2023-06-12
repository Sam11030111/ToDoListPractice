//
//  User.swift
//  ToDoListPractice
//
//  Created by 李竑陞 on 2023/6/12.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
