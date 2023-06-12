//
//  NewItemView.swift
//  ToDoListPractice
//
//  Created by 李竑陞 on 2023/6/12.
//

import SwiftUI

struct NewItemView: View {
    
    @Binding var newItemIsPresented: Bool
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemIsPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
