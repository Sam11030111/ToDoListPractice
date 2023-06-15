//
//  ProfileView.swift
//  ToDoListPractice
//
//  Created by 李竑陞 on 2023/6/12.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .foregroundColor(.green)
            .padding()
        
        VStack(alignment: .leading) {
            HStack {
                Text("Name:")
                    .bold()
                Text(user.name)
            }
            .padding()
            
            HStack {
                Text("Email:")
                    .bold()
                Text(user.email)
            }
            .padding()
            
            HStack {
                Text("Member since:")
                    .bold()
                Text(Date(timeIntervalSince1970: user.joined)
                    .formatted(date: .abbreviated, time: .shortened))
            }
            .padding()
        }
        .padding()
        
        Button {
            // Log Out
            viewModel.logout()
        } label: {
            Text("Log Out")
                .tint(.red)
        }
        .padding()
        
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
