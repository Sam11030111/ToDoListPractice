//
//  NewItemView.swift
//  ToDoListPractice
//
//  Created by 李竑陞 on 2023/6/12.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemIsPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text("New Item")
                    .font(.system(size: 32))
                    .bold()
                    .padding(.top, 30)
                
                Form {
                    TextField("Title", text: $viewModel.title)
                    
                    DatePicker("Due date", selection: $viewModel.dueDate)
                        .datePickerStyle(.graphical)
                    
                    CustomBtn(title: "Save", backgroundColor: .indigo) {
                        if viewModel.canSave {
                            viewModel.save()
                            newItemIsPresented = false
                        } else {
                            viewModel.showAlert = true
                        }
                    }
                    .padding()
                }
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Error"),
                          message: Text("Please fill in all fields and select due date that is today or newer."))
                }
            }
            .toolbar {
                Button {
                    // Action
                    newItemIsPresented = false
                } label: {
                    Image(systemName: "xmark")
                }
            }
        }
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
