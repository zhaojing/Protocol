//
//  UserRequest.swift
//  Protocol
//
//  Created by JingZhao on 1/12/17.
//  Copyright © 2017 JingZhao. All rights reserved.
//

import UIKit

enum HTTPMethod: String {
    case GET
    case POST
}

protocol Request {
    var host: String { get }
    var path: String { get }
    
    var method: HTTPMethod { get }
    var parameter: [String: Any] { get }
    
    associatedtype Response: Decodable
}

struct UserRequest: Request {
    let name: String
    
    let host = "https://api.onevcat.com"
    var path: String {
        return "/users/\(name)"
    }
    let method: HTTPMethod = .GET
    let parameter: [String: Any] = [:]
    typealias Response = User
    
    func parse(data: Data) -> User? {
        return User(data: data)
    }
}
