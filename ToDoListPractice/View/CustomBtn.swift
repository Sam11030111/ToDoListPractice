//
//  CustomBtn.swift
//  ToDoListPractice
//
//  Created by 李竑陞 on 2023/6/11.
//

import SwiftUI

struct CustomBtn: View {
    
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            // Action
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

struct CustomBtn_Previews: PreviewProvider {
    static var previews: some View {
        CustomBtn(title: "Button", backgroundColor: .pink) {
            // ...
        }
    }
}
