//
//  ResponseWrapper.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/06.
//

import Foundation

struct ResponseWrapper<T: Decodable>: Decodable {
    let data: T?
    let message: String?
}
