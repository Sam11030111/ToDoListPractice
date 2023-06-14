//
//  ToDoListItem.swift
//  ToDoListPractice
//
//  Created by 李竑陞 on 2023/6/12.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
