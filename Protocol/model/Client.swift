//
//  Client.swift
//  Protocol
//
//  Created by JingZhao on 1/16/17.
//  Copyright © 2017 JingZhao. All rights reserved.
//

import Foundation

protocol Client {
    
    func send<T : Request>(_ r : T, handler : @escaping (T.Response?) -> Void)
    
    var host: String { get }
}

struct URLSessionClient: Client {
    
    let host = "https://api.onevcat.com"
    
    func send<T: Request>(_ r: T, handler: @escaping (T.Response?) -> Void) {
        let url = URL(string: host.appending(r.path))!
        var request = URLRequest(url: url)
        request.httpMethod = r.method.rawValue
        
        let task = URLSession.shared.dataTask(with: request) {
            data, _, error in
            if let data = data, let res = T.Response.parse(data: data) {
                DispatchQueue.main.async { handler(res) }
            } else {
                DispatchQueue.main.async { handler(nil) }
            }
        }
        task.resume()
    }
}
