//
//  Response.swift
//  Protocol
//
//  Created by JingZhao on 1/16/17.
//  Copyright © 2017 JingZhao. All rights reserved.
//

import Foundation

protocol Decodable {
    static func parse(data: Data) -> Self?
}

extension User: Decodable {
    static func parse(data: Data) -> User? {
        return User(data: data)
    }
}
