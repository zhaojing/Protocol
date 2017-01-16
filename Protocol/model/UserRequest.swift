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
    associatedtype Response
    func parse(data: Data) -> Response?
}

extension Request {
    func send(handler: @escaping (Response?) -> Void) {
        let url = URL(string: host.appending(path))!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        let task = URLSession.shared.dataTask(with: request) {
            data, res, error in
            if let data = data, let res = self.parse(data: data) {
                DispatchQueue.main.async { handler(res) }
            } else {
                DispatchQueue.main.async { handler(nil) }
            }
        }
        task.resume()
    }
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
