//
//  MenuViewController.swift
//  twitter-client
//
//  Created by Gideon Goodwin on 9/21/15.
//  Copyright © 2015 Gideon Goodwin. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var menuTableView: UITableView!

    var profileVC: ProfileViewController!
    var tweetsVC: TweetsViewController!
    private var vcList: [UIViewController]!

    // TODO: less tightly coupled
    var burgerVC: BurgerViewController!

    let menuItems = ["Profile", "Tweets"]

    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        profileVC = storyboard.instantiateViewControllerWithIdentifier("ProfileViewController") as! ProfileViewController
        profileVC.user = User.currentUser
        tweetsVC = storyboard.instantiateViewControllerWithIdentifier("TweetsViewController") as! TweetsViewController

        vcList = [UIViewController]()
        vcList.append(profileVC)
        vcList.append(tweetsVC)

        menuTableView.delegate = self
        menuTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuCell", forIndexPath:indexPath) as! MenuCell
        cell.menuLabel.text = menuItems[indexPath.row]
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        burgerVC.contentViewController = vcList[indexPath.row]
    }
}
