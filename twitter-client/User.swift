//
//  User.swift
//  twitter-client
//
//  Created by Gideon Goodwin on 9/14/15.
//  Copyright © 2015 Gideon Goodwin. All rights reserved.
//

import UIKit

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
}
