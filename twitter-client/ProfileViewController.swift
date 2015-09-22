//
//  ProfileViewController.swift
//  twitter-client
//
//  Created by Gideon Goodwin on 9/21/15.
//  Copyright © 2015 Gideon Goodwin. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var tweetsLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!

    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let user = user {
            let profileImageUrl = NSURL(string: user.profileImageUrl!)
            profileImageView.setImageWithURL(profileImageUrl)
            fullNameLabel.text = user.name
            handleLabel.text = "@\(user.screenname!)"
            tweetsLabel.text = "\(user.tweets!)"
            followingLabel.text = "\(user.following!)"
            followersLabel.text = "\(user.followers!)"
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
