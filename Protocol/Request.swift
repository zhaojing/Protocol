//
//  Request.swift
//  Protocol
//
//  Created by JingZhao on 1/16/17.
//  Copyright © 2017 JingZhao. All rights reserved.
//

import Foundation

import UIKit

enum HTTPMethod: String {
    case GET
    case POST
}

protocol Request {
    var path: String { get }
    
    var method: HTTPMethod { get }
    var parameter: [String: Any] { get }
    
    associatedtype Response: Decodable
}
