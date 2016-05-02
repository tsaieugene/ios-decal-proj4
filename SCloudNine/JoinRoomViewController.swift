//
//  JoinRoomViewController.swift
//  SCloudNine
//
//  Created by Alex Huang on 4/29/16.
//  Copyright © 2016 iOSDecal. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class JoinRoomViewController: UIViewController{
    var roomNameTextField = UITextField()
    var passwordTextField = UITextField()
    


    override func viewDidLoad() {
        super.viewDidLoad()
//        appDelegate.mpcManager.delegate = self
        
        
        
        view.backgroundColor = UIColor(red: 0.914, green: 0.918, blue: 0.918, alpha: 1)
        // Do any additional setup after loading the view.
        // Create navigation bar
        let navBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.size.width, Constants.navBarHeight))
        
        // Create a navigation item with a title
        let navigationItem = UINavigationItem()
        navigationItem.title = "Join A Room"
        
        // Create back button
        let backButton =  UIBarButtonItem(title: "Back", style:   UIBarButtonItemStyle.Plain, target: self, action: "goBack")
        navigationItem.leftBarButtonItem = backButton
        navBar.items = [navigationItem]
        
        //Create create button
        let createButton = UIBarButtonItem(title: "Join", style: UIBarButtonItemStyle.Plain, target: self, action: "joinRoom")
        navigationItem.rightBarButtonItem = createButton
        navBar.items = [navigationItem]
        self.view.addSubview(navBar)
        
        roomNameTextField.frame = CGRect(x: Constants.centerHorizontally(Constants.labelWidth), y: Constants.screenHeight*1/4, width: Constants.labelWidth, height: Constants.textFieldHeight)
        roomNameTextField.placeholder = "Enter Room Name"
        Constants.setTextFieldAttributes(roomNameTextField)
        self.view.addSubview(roomNameTextField)
        
        
        passwordTextField.frame = CGRect(x: Constants.centerHorizontally(Constants.labelWidth), y: CGRectGetMaxY(roomNameTextField.frame) + 10, width: Constants.labelWidth, height: Constants.textFieldHeight)
        passwordTextField.placeholder = "Password (If Required)"
        Constants.setTextFieldAttributes(passwordTextField)
        self.view.addSubview(passwordTextField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(animated: Bool) {
        roomNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    
    func goBack() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func joinRoom() {
        if (roomNameTextField.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) != "") {
            MainViewController.roomInfo.append(roomNameTextField.text!)
            MainViewController.roomMembers.append("Joined Person")
            if passwordTextField.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) != "" {
                MainViewController.roomInfo.append(passwordTextField.text!)
            }
            self.presentViewController(MainViewController(), animated: true, completion: nil)
        } else {
            let noNameAlert = UIAlertController(title: "No Name Enter", message: "Room must have a name!",preferredStyle: .Alert)
            noNameAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action) -> Void in noNameAlert.dismissViewControllerAnimated(true, completion: nil)
            }))
            self.presentViewController(noNameAlert, animated: true, completion: nil)
        }
    }
    
    
    func foundPeer() {
        print("hi")
    }
    
    func lostPeer() {
        print("bye")
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
