//
//  TestView.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/18.
//

import SwiftUI

import Cassette

struct TestView: View {
    var body: some View {
        VStack(spacing: 20) {
            BtnCassette(buttonMode: .normal(text: "Normal Button"))
            
            BtnCassette(buttonMode: .imageButton(text: "Leading Image Button", imageDirection: .leading, imageType: .system, imageName: "globe"))
            
            BtnCassette(buttonMode: .imageButton(text: "Trailing Image Button", imageDirection: .trailing, imageType: .system, imageName: "person"))
            
            BtnCassette(buttonMode: .bindingText(text: .constant("Binding Text Button")))
            
        }.padding(.horizontal, 16)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
