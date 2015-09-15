//
//  TweetsViewController.swift
//  twitter-client
//
//  Created by Gideon Goodwin on 9/14/15.
//  Copyright © 2015 Gideon Goodwin. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tweets: [Tweet]?

    @IBOutlet weak var tweetsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tweetsTableView.delegate = self
        tweetsTableView.dataSource = self
        TwitterClient.sharedInstance.homeTimelineWithParams(nil, completion: { (tweets, error) -> Void in
            if (tweets != nil) {
                self.tweets = tweets
                self.tweetsTableView.reloadData()
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

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tweets != nil) {
            return tweets!.count
        }
        return 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tweetCellView", forIndexPath:indexPath) as! TweetCellView
        let tweet = tweets![indexPath.row]
        cell.authorLabel.text = tweet.author?.name
        cell.tweetLabel.text = tweet.text
        if (tweet.createdAt != nil) {
            let dateFormatter = NSDateFormatter()
            dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
            dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
            cell.dateLabel.text = dateFormatter.stringFromDate(tweet.createdAt!)
        }
        if (tweet.profileImageUrl != nil) {
            let profileImageUrl = NSURL(string: tweet.profileImageUrl!)
            if (profileImageUrl != nil) {
                cell.profileImageView.setImageWithURL(profileImageUrl)
            }
        }
        return cell
    }
}
