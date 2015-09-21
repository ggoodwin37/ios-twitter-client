//
//  BurgerViewController.swift
//  twitter-client
//
//  Created by Gideon Goodwin on 9/21/15.
//  Copyright © 2015 Gideon Goodwin. All rights reserved.
//

import UIKit

class BurgerViewController: UIViewController {
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentViewLeftMarginConstraint: NSLayoutConstraint!

    var originalLeftMargin: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onPanActionGesture(sender: UIPanGestureRecognizer) {
        //contentViewLeftMarginConstraint
        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        if (sender.state == UIGestureRecognizerState.Began) {
            originalLeftMargin = contentViewLeftMarginConstraint.constant
        } else if (sender.state == UIGestureRecognizerState.Changed) {
            contentViewLeftMarginConstraint.constant = originalLeftMargin + translation.x
        } else if (sender.state == UIGestureRecognizerState.Ended) {
        }
        
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
