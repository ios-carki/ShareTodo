//
//  RegisterViewModel.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/06.
//

import Foundation
import UIKit

final class RegisterViewModel: ObservableObject {
    @Published var idText: String = ""
    @Published var passwordText: String = ""
    @Published var nickNameText: String = ""
    
    //Profile Image
    @Published var presentSetProfile: Bool = false
    @Published var image: UIImage?
    @Published var presentGallery = false
    @Published var presentCamera = false
    @Published var isCaptured = false
    
    //Loading
    @Published var isLoading: Bool = false
    
    //Networking
    var services = RestServices()
    
    func registerUser(completion: @escaping (Bool) -> Void) {
        isLoading = true
        print("요청 nickName: ", nickNameText)
        
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
