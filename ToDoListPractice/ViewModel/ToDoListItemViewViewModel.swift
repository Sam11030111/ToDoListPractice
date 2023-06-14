//
//  ToDoListItemViewViewModel.swift
//  ToDoListPractice
//
//  Created by 李竑陞 on 2023/6/13.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewViewModel: ObservableObject {
    
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var newItem = item
        
        newItem.setDone(!item.isDone)
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}
