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
        TwitterClient.sharedInstance.loginWithCompletion() {
            (user: User?, erro: NSError?) in
            if (user != nil) {
                self.performSegueWithIdentifier("loginSegue", sender: self)
            } else {
                // handle login error
            }
        }
    }


}

