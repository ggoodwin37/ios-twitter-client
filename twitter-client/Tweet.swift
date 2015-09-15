//
//  Tweet.swift
//  twitter-client
//
//  Created by Gideon Goodwin on 9/14/15.
//  Copyright © 2015 Gideon Goodwin. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    let author: User?
    let text: String?
    let createdAtString: String?
    let createdAt: NSDate?
    let profileImageUrl: String?

    init(dictionary: NSDictionary) {
        author = User(dictionary: dictionary["user"] as! NSDictionary)
        text = dictionary["text"] as? String
        createdAtString = dictionary["created_at"] as? String
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        createdAt = formatter.dateFromString(createdAtString!)
        profileImageUrl = dictionary.valueForKeyPath("user.profile_image_url") as? String
    }

    class func tweetsWithArray(array: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        for dictionary in array {
            tweets.append(Tweet(dictionary: dictionary))
        }
        return tweets
    }
}
