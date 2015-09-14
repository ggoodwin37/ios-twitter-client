//
//  ViewController.swift
//  twitter-client
//
//  Created by Gideon Goodwin on 9/11/15.
//  Copyright © 2015 Gideon Goodwin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func loginWithTwitterButtonPressed(sender: AnyObject) {
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        TwitterClient.sharedInstance.fetchRequestTokenWithPath("oauth/request_token", method: "GET",
            callbackURL: NSURL(string:"cptwitterdemo://oauth"), scope: nil,
            success: { (requestToken: BDBOAuth1Credential!) -> Void in
                print("Got ze token")
            },
            failure: { (error: NSError!) -> Void in
                print("Got FAIL")
            }
        )
    }


}

