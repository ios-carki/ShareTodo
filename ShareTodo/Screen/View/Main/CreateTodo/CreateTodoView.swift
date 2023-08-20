//
//  CreateTodoView.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/15.
//

import SwiftUI

struct CreateTodoView: View {
    weak var navigation: CustomNavigationController?
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            Text("Create Todo View")
        }
    }
}

struct CreateTodoView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTodoView()
    }
}
