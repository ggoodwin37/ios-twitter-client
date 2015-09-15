//
//  User.swift
//  twitter-client
//
//  Created by Gideon Goodwin on 9/14/15.
//  Copyright © 2015 Gideon Goodwin. All rights reserved.
//

import UIKit

var _currentUser: User?
let currentUserKey = "kCurrentUserKey"
let userDidLoginNotification = "userDidLoginNotification"
let userDidLogoutNotification = "userDidLogoutNotification"

class User: NSObject {
    let name: String?
    let screenname: String?
    let profileImageUrl: String?
    let tagline: String?
    let dictionary: NSDictionary

    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        profileImageUrl = dictionary["profile_image_url"] as? String
        tagline = dictionary["description"] as? String
    }

    func logout() {
        User.currentUser = nil
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        NSNotificationCenter.defaultCenter().postNotificationName(userDidLogoutNotification, object: nil)
    }

    class var currentUser: User? {
        get {
            if (_currentUser == nil) {
                let data = NSUserDefaults.standardUserDefaults().dataForKey(currentUserKey)
                if (data != nil) {
                    let dictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as? NSDictionary
                    _currentUser = User(dictionary: dictionary!)
                }
            }
            return _currentUser
        }
        set(user) {
            _currentUser = user
            if (_currentUser != nil) {
                let data = try! NSJSONSerialization.dataWithJSONObject(user!.dictionary, options: NSJSONWritingOptions.PrettyPrinted)
                NSUserDefaults.standardUserDefaults().setObject(data, forKey: currentUserKey)
            } else {
                NSUserDefaults.standardUserDefaults().setObject(nil, forKey: currentUserKey)
            }
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
}
