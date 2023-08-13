//
//  EndPoints.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/06.
//

import Foundation

struct EndPoints {
    static let endPointVersion = "/api/"
    static let endPointController = "/"
    
    struct Authentication {
        static var register: String { get { return "\(endPointVersion)register"}}
        static var login: String { get { return "\(endPointVersion)login"}}
    }
    
}
