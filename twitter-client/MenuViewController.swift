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

    let menuItems = ["One", "Two"]

    override func viewDidLoad() {
        super.viewDidLoad()

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

}
