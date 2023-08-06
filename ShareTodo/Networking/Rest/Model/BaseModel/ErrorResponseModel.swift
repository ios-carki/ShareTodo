//
//  ErrorResponseModel.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/06.
//

import Foundation

struct ErrorResponseModel : Codable {
    let error : Bool?
    let reason : String?
}
