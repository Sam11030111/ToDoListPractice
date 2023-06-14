//
//  ToDoListItemView.swift
//  ToDoListPractice
//
//  Created by 李竑陞 on 2023/6/13.
//

import SwiftUI

struct ToDoListItemView: View {
    
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .padding(.top, 5)
                Text(Date(timeIntervalSince1970: item.dueDate)
                    .formatted(date: .abbreviated, time: .shortened))
                .font(.footnote)
                .foregroundColor(Color(.secondaryLabel))
                .padding(.bottom, 5)
            }
            
            Spacer()
            
            Button {
                // Action
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.indigo)
            }
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(
            item: ToDoListItem(id: "111",
                               title: "Basket",
                               dueDate: Date().timeIntervalSince1970,
                               createDate: Date().timeIntervalSince1970,
                               isDone: false)
        )
    }
}
