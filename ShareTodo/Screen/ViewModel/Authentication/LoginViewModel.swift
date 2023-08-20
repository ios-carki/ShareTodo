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
    
    //Loading
    @Published var isLoading: Bool = false
    
    //Toast
    @Published var loginFailToast: Bool = false
    
    //Networking
    var services = RestServices()
    
    func loginFunction(completion: @escaping (Bool) -> Void) {
        isLoading = true
        
        services.loginUser(args: LoginRequestModel(userID: idText, password: passwordText)) { result, error in
            if result != nil {
                print(result?.data?.nickName)
                print(result?.data?.userId)
                completion(true)
            } else {
                completion(false)
            }
            self.isLoading = false
        }
    }
}
