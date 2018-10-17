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
    var dictionary: [String: Any]?
    var name: String?
    var screenName: String?
    var profileImage: String?
    var followersCount: String
    var numberofTweets: String
    var friendsCount: String
    
    
    
    // TODO: Create initializer
    init(dictionary: [String: Any]) {
        self.dictionary = dictionary
        name = dictionary["name"] as? String
        screenName = dictionary["screen_name"] as? String
        profileImage = dictionary["profile_image_url_https"] as? String
        followersCount = String(dictionary["followers_count"] as! Int)
        numberofTweets = String(dictionary["statuses_count"] as! Int)
        friendsCount = String(dictionary["friends_count"] as! Int)
    }
    
    private static var _current: User?
    
    static var current: User? {
        get {
            if _current == nil {
                let defaults = UserDefaults.standard
                if let userData = defaults.data(forKey: "currentUserData") {
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! [String: Any]
                    _current = User(dictionary: dictionary)
                }
            }
            return _current
        }
        set (user) {
            _current = user
            let defaults = UserDefaults.standard
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.dictionary!, options: [])
                defaults.set(data, forKey: "currentUserData")
            } else {
                defaults.removeObject(forKey: "currentUserData")
            }
        }
    }
    
    
    
    
}
