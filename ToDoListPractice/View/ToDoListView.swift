//
//  ToDoListView.swift
//  ToDoListPractice
//
//  Created by 李竑陞 on 2023/6/12.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var item: [ToDoListItem]
    
    init(userId: String) {
        self._item = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(item) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                // Action
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    // Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemIsPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "YNOeIc2hpHbvxXmMgN1JSodQ9ky1")
    }
}
