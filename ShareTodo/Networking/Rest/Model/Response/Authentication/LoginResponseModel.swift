//
//  LoginResponseModel.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/13.
//

import Foundation

struct LoginResponseModel: Codable {
    var id: UUID?
    var userId: String?
    var nickName: String?
    var token: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case userId = "userId"
        case nickName = "nickName"
        case token = "token"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(UUID.self, forKey: .id)
        userId = try values.decodeIfPresent(String.self, forKey: .userId)
        nickName = try values.decodeIfPresent(String.self, forKey: .nickName)
        token = try values.decodeIfPresent(String.self, forKey: .token)
    }
}
