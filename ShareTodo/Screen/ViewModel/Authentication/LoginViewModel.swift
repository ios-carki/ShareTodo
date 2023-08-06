//
//  LoginViewModel.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/06.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var idText: String = ""
    @Published var passwordText: String = ""
    
    @Published var autoLoginIsOn: Bool = false
}
