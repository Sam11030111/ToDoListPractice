//
//  HeaderView.swift
//  ToDoListPractice
//
//  Created by 李竑陞 on 2023/6/11.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subTitle: String
    let backgroundcolor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundcolor)
                .rotationEffect(Angle(degrees: 15))
            
            VStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .bold()
                
                Text(subTitle)
                    .foregroundColor(.white)
                    .font(.system(size: 30))
            }
            .padding(.top, 80)
            
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subTitle: "SubTitle", backgroundcolor: .indigo)
    }
}
