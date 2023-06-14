//
//  ToDoListViewViewModel.swift
//  ToDoListPractice
//
//  Created by 李竑陞 on 2023/6/12.
//

import Foundation
//import FirebaseAuth
import FirebaseFirestore

class ToDoListViewViewModel: ObservableObject {
    
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
//        guard let userId = Auth.auth().currentUser?.uid else {
//            return
//        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
