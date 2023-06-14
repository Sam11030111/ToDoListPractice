//
//  MainViewViewModel.swift
//  ToDoListPractice
//
//  Created by 李竑陞 on 2023/6/12.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
    
    @Published var currentUserId = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener({ [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        })
    }
    
    public var inSignedIn: Bool {
        return Auth.auth().currentUser != nil
        
        // 與上方code一樣意思
        //        if Auth.auth().currentUser != nil {
        //            return true
        //        } else {
        //            return false
        //        }
    }
}
