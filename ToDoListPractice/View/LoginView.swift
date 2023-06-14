//
//  LoginView.swift
//  ToDoListPractice
//
//  Created by 李竑陞 on 2023/6/11.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header View
                HeaderView(title: "To Do List", subTitle: "Get things done", backgroundcolor: .indigo)
                
                // Form
                Form {
                    // Error Message
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    // TextField
                    TextField("Email Address", text: $viewModel.email)
                        .autocapitalization(.none)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TextField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    // Button
                    CustomBtn(title: "Log in", backgroundColor: .yellow) {
                        // Log in
                        viewModel.logIn()
                    }
                    .padding()
                }
                
                VStack {
                    Text("New around here?")
                    NavigationLink("Create an account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
