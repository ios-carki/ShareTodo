//
//  RegisterUserResponseModel.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/06.
//

import Foundation

struct RegisterUserResponseModel: Codable {
    var userID: String?
    var nickName: String?
    
    enum CodingKeys: String, CodingKey {
        case userID = "userID"
        case nickName = "nickName"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userID = try values.decodeIfPresent(String.self, forKey: .userID)
        nickName = try values.decodeIfPresent(String.self, forKey: .nickName)
    }
}
