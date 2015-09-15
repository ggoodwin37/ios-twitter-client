//
//  TweetsViewController.swift
//  twitter-client
//
//  Created by Gideon Goodwin on 9/14/15.
//  Copyright © 2015 Gideon Goodwin. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        TwitterClient.sharedInstance.homeTimelineWithParams(nil, completion: { (tweets, error) -> Void in
            if (tweets != nil) {
                for tweet in tweets! {
                    print("tweet text: \(tweet.text!), created: \(tweet.createdAt!)")
                }
            }
        }
    )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogout(sender: AnyObject) {
        User.currentUser?.logout()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
