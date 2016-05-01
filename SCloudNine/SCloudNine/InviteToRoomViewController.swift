//
//  InviteToRoomViewController.swift
//  SCloudNine
//
//  Created by Alex Huang on 5/1/16.
//  Copyright © 2016 iOSDecal. All rights reserved.
//

import UIKit

class InviteToRoomViewController: UIViewController {
    
    var personToInvite = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.914, green: 0.918, blue: 0.918, alpha: 1)
        
        // Do any additional setup after loading the view.
        // Create navigation bar
        let navBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.size.width, Constants.navBarHeight))

        // Create a navigation item with a title
        let navigationItem = UINavigationItem()
        navigationItem.title = "Create A Room"
        
        // Create back button
        let backButton =  UIBarButtonItem(title: "Back", style:   UIBarButtonItemStyle.Plain, target: self, action: "goBack")
        navigationItem.leftBarButtonItem = backButton
        navBar.items = [navigationItem]
        
        //Create create button
        let createButton = UIBarButtonItem(title: "Invite", style: UIBarButtonItemStyle.Plain, target: self, action: "invitePerson")
        navigationItem.rightBarButtonItem = createButton
        navBar.items = [navigationItem]
        self.view.addSubview(navBar)
        
        
        personToInvite.frame = CGRect(x: Constants.centerHorizontally(Constants.labelWidth), y: Constants.screenHeight*1/4, width: Constants.labelWidth, height: Constants.textFieldHeight)
        personToInvite.placeholder = "Enter Username"
        personToInvite.textAlignment = .Center
        personToInvite.autocorrectionType = .No
        personToInvite.textColor = UIColor.orangeColor()
        personToInvite.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(personToInvite)
        

    }
    
    func goBack() {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    func invitePerson() {
        if (personToInvite.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) != "") {
            MainViewController.roomInfo.append(personToInvite.text!)
            MainViewController.roomMembers.append(personToInvite.text!)
            self.presentViewController(MainViewController(), animated: true, completion: nil)
        } else {
            let noNameAlert = UIAlertController(title: "No Name Entered", message: "Must Specify a Person to Invite!",preferredStyle: .Alert)
            noNameAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action) -> Void in noNameAlert.dismissViewControllerAnimated(true, completion: nil)
            }))
            self.presentViewController(noNameAlert, animated: true, completion: nil)
        }
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
