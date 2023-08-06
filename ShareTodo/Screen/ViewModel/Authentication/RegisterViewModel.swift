//
//  RegisterViewModel.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/06.
//

import Foundation

final class RegisterViewModel: ObservableObject {
    @Published var idText: String = ""
    @Published var passwordText: String = ""
    @Published var nickNameText: String = ""
    
    //Loading
    @Published var isLoading: Bool = false
    
    //Networking
    var services = RestServices()
    
    func registerUser(completion: @escaping (Bool) -> Void) {
        isLoading = true
        services.registerUser(args: RegisterUserRequestModel(userID: idText, password: passwordText, nickName: nickNameText)) { result, error in
            if result != nil {
                print("등록 성공")
                print("ID: \(result?.data?.userID ?? "")")
                print("NickName: \(result?.data?.nickName ?? "")")
                completion(true)
            } else {
                completion(false)
            }
            self.isLoading = false
        }
    }
}
