//
//  API.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/06.
//

import Foundation
import Alamofire

// MARK: - API class will help to define the APIs in the remote networking when calling from the server
public class API{
    
    public let path: String
    public let method: HTTPMethod
    //public let stringParameters: String?//MARK: String 파라미터를 위해서 추가
    public let headerParamaters: [String: String]
    public let queryParameters: [String: Any]
    public let bodyParamaters: [String: Any]
    public let bodyEncoding: ParameterEncoding
   
    init(path: String,
         method: HTTPMethod,
         headerParamaters: [String: String] = [:],
         queryParameters: [String: Any] = [:],
         bodyParamatersEncodable: Encodable? = nil,
         bodyParamaters: [String: Any] = [:],
         bodyEncoding: ParameterEncoding = JSONEncoding.default) {
        self.path = path
        self.method = method
        self.headerParamaters = headerParamaters
        self.queryParameters = queryParameters
        self.bodyParamaters = bodyParamaters
        self.bodyEncoding = bodyEncoding
    }
}

//
//import Foundation
//import Alamofire
//
//// MARK: - API class will help to define the APIs in the remote networking when calling from the server
//public class API{
//
//    public let path: String
//    public let method: HTTPMethod
//    public let headerParamaters: [String: String]
//    public let queryParameters: [String: Any]
//    public let bodyParamaters: [String: Any]
//    public let bodyEncoding: ParameterEncoding
//
//    init(path: String,
//         method: HTTPMethod,
//         headerParamaters: [String: String] = [:],
//         queryParameters: [String: Any] = [:],
//         bodyParamatersEncodable: Encodable? = nil,
//         bodyParamaters: [String: Any] = [:],
//         bodyEncoding: ParameterEncoding = JSONEncoding.default) {
//        self.path = path
//        self.method = method
//        self.headerParamaters = headerParamaters
//        self.queryParameters = queryParameters
//        self.bodyParamaters = bodyParamaters
//        self.bodyEncoding = bodyEncoding
//    }
//}
