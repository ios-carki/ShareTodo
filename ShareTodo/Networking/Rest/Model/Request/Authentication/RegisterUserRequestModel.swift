//
//  RegisterUserRequestModel.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/06.
///

import Foundation

struct RegisterUserRequestModel: Codable {
    let userID: String?
    let password: String?
    let nickName: String?
}
