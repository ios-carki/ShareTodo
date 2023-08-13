//
//  RestServices.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/06.
//

import UIKit
import Alamofire

// MARK: - Networking call within this class will happen
struct RestServices {
    //MARK: api/register
    func registerUser(args: RegisterUserRequestModel, completion: @escaping (ResponseWrapper<RegisterUserResponseModel>?, ErrorResponseModel?) -> Void) {
        guard let params = args.asDictionary() else {
            completion(nil, ErrorResponseModel(error: true, reason: "args_error"))
            return
        }
        
        let event = API(
            path: "\(EndPoints.Authentication.register)",
            method: .post,
            headerParamaters: ["Content-Type":"application/json"],
            bodyParamaters: params
        )
        
        BaseNetworking.shared.request(RegisterUserResponseModel.self, endPoint: event, completion: completion)
    }
    
    //MARK: api/login
    func loginUser(args: LoginRequestModel, completion: @escaping (ResponseWrapper<LoginResponseModel>?, ErrorResponseModel?) -> Void) {
        guard let params = args.asDictionary() else {
            completion(nil, ErrorResponseModel(error: true, reason: "args_error"))
            return
        }
        
        let event = API(
            path: "\(EndPoints.Authentication.login)",
            method: .post,
            headerParamaters: ["Content-Type":"application/json"],
            bodyParamaters: params
        )
        
        BaseNetworking.shared.request(LoginResponseModel.self, endPoint: event, completion: completion)
    }
}
