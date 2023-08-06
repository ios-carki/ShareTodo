//
//  BaseNetworking.swift
//  ShareTodo
//
//  Created by Carki on 2023/08/06.
//

import Foundation
import UIKit

import Alamofire

final class BaseNetworking {
    
    public static let shared: BaseNetworking = BaseNetworking()
    
    private init() { }
    
    //MARK: Only BodyParam Request
    func request<T: Decodable>(_ t: T.Type, endPoint: API, completion: @escaping (_ result: ResponseWrapper<T>?, _ error: ErrorResponseModel?) -> Void){
        
        var url = buildRequestURL(endPoint: endPoint)
        
        if(url != nil) {
            AF.request(url!,
                       method: endPoint.method,
                       parameters: endPoint.bodyParamaters,
                       encoding: endPoint.bodyEncoding,
                       headers: HTTPHeaders(endPoint.headerParamaters)
            ).validate().responseDecodable(of: ResponseWrapper<T>.self)
            { (response) in
                switch response.result {
                case .success(_):
                    guard let response = response.value else
                    {
                        completion(nil, ErrorResponseModel(error: true, reason: "parsing_error"))
                        return
                    }
                    completion(response, nil)
                case .failure(let error):
                    print(error.localizedDescription)
                    print(response.request?.headers)
                    print("👹👹👹👹👹Status Code: ", response.response?.statusCode)
                    completion(nil, ErrorResponseModel(error: true, reason: "server_error"))
                }
            }
        }
        
        else {
            completion(nil, ErrorResponseModel(error: true, reason: "url_error"))
        }
    }
    
    private func buildRequestURL(endPoint: API) -> URL? {
        
        let env = AppEnvironment.current
        var components = URLComponents()
        components.scheme = "http"
        components.host = env.baseURL
        components.path = endPoint.path
        components.port = 8080
        ///if we have any query parameters we should add them here
        components.queryItems = endPoint.queryParameters.map {
            URLQueryItem(name: $0, value: "\($1)")
        }
        
        print("현재 서비스: ", AppEnvironment.current)
        print("풀 URL: \(components.scheme!)\(components.host!)\(components.path)\(components.port ?? 3001)")
        return components.url
    }
}
