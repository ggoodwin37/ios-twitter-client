//
//  ViewController.swift
//  twitter-client
//
//  Created by Gideon Goodwin on 9/11/15.
//  Copyright © 2015 Gideon Goodwin. All rights reserved.
//

import UIKit

let twitterConsumerKey = "SucVaBdt4JzDK2d1i2oLvGHVq"
let twitterConsumerSecret = "y6EYS9N8WoYwG50aX5WyCPfiu5nQRRg0yKWzxkY0FrMQkt5Cr5"
let twitterBaseUrl = NSURL(string: "https://api.twitter.com")

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        TwitterClient(baseURL: twitterBaseUrl, consumerKey: twitterConsumerKey,
                consumerSecret: twitterConsumerSecret)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

