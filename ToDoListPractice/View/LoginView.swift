//
//  LoginView.swift
//  ToDoListPractice
//
//  Created by 李竑陞 on 2023/6/11.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Header View
                HeaderView(title: "To Do List", subTitle: "Get things done", backgroundcolor: .indigo)
                
                // Form
                Form {
                    // TextField
                    TextField("Email Address", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TextField("Password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    // Button
                    CustomBtn(title: "Log in", backgroundColor: .yellow) {
                        // Log in
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
