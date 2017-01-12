//
//  User.swift
//  Protocol
//
//  Created by JingZhao on 1/12/17.
//  Copyright © 2017 JingZhao. All rights reserved.
//

import UIKit

struct User {
    let name: String
    let message: String
    
    init?(data: Data) {
        guard let obj = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            return nil
        }
        guard let name = obj?["name"] as? String else {
            return nil
        }
        guard let message = obj?["message"] as? String else {
            return nil
        }
        
        self.name = name
        self.message = message
    }
}
