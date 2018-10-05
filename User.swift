//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Roberto Bradley on 10/5/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import Foundation

class User {
    
    // TODO: Add properties
    var name: String?
    var screenName: String?
    static var current: User?
    // TODO: Create initializer
    init(dictionary: [String: Any]) {
        name = dictionary["name"] as? String
        screenName = dictionary["screen_name"] as? String
    }
    
}
