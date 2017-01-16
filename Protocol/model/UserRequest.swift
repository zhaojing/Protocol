//
//  UserRequest.swift
//  Protocol
//
//  Created by JingZhao on 1/12/17.
//  Copyright © 2017 JingZhao. All rights reserved.
//

import UIKit

struct UserRequest: Request {
    let name: String
    
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
