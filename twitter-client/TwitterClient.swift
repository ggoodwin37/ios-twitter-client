//
//  TwitterClient.swift
//  twitter-client
//
//  Created by Gideon Goodwin on 9/14/15.
//  Copyright © 2015 Gideon Goodwin. All rights reserved.
//

import UIKit

let twitterConsumerKey = "SucVaBdt4JzDK2d1i2oLvGHVq"
let twitterConsumerSecret = "y6EYS9N8WoYwG50aX5WyCPfiu5nQRRg0yKWzxkY0FrMQkt5Cr5"
let twitterBaseUrl = NSURL(string: "https://api.twitter.com")

class TwitterClient: BDBOAuth1RequestOperationManager {
    var loginCompletion: ((user: User?, error: NSError?) -> Void)?

    static let sharedInstance = TwitterClient(baseURL: twitterBaseUrl, consumerKey: twitterConsumerKey,
        consumerSecret: twitterConsumerSecret)

    func loginWithCompletion(completion: (user: User?, error: NSError?) -> Void) {
        loginCompletion = completion

        // fetch request token and redirect to authorization page
        self.requestSerializer.removeAccessToken()
        self.fetchRequestTokenWithPath("oauth/request_token", method: "GET",
            callbackURL: NSURL(string:"cptwitterdemo://oauth"), scope: nil,
            success: { (requestToken: BDBOAuth1Credential!) -> Void in
                let authURL = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")!
                UIApplication.sharedApplication().openURL(authURL)
            },
            failure: { (error: NSError!) -> Void in
                self.loginCompletion?(user: nil, error: error)
            }
        )
    }

    func openURL(url: NSURL) -> Bool {
        fetchAccessTokenWithPath("oauth/access_token", method: "POST",
            requestToken: BDBOAuth1Credential(queryString: url.query),
            success: { (accessToken: BDBOAuth1Credential!) -> Void in
                self.requestSerializer.saveAccessToken(accessToken)
                self.GET("1.1/account/verify_credentials.json", parameters: nil,
                    success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                        let user = User(dictionary: response as! NSDictionary)
                        print("Deserialized user name: \(user.name!)")
                        self.loginCompletion?(user: user, error: nil)
                    }, failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                        print("Failed to get user")
                        self.loginCompletion?(user: nil, error: error)
                    }
                )
//                self.GET("1.1/statuses/home_timeline.json", parameters: nil,
//                    success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
//                        //print("Got home timeline: \(response)")
//                        let tweets = Tweet.tweetsWithArray(response as! [NSDictionary])
//                        for tweet in tweets {
//                            print("tweet text: \(tweet.text!), created: \(tweet.createdAt!)")
//                        }
//                    }, failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
//                        print("Failed to get user")
//                    }
//                )
            },
            failure: { (error: NSError!) -> Void in
                self.loginCompletion?(user: nil, error: error)
            }
        )
        return true
    }
}
