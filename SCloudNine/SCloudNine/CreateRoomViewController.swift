//
//  CreateRoomViewController.swift
//  SCloudNine
//
//  Created by Alex Huang on 4/29/16.
//  Copyright © 2016 iOSDecal. All rights reserved.
//

import UIKit

class CreateRoomViewController: UIViewController {
    
    var roomNameTextField = UITextField()
    var passwordTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create navigation bar
        let navBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.size.width, Constants.navBarHeight))
        navBar.backgroundColor = UIColor.redColor()
        
        // Create a navigation item with a title
        let navigationItem = UINavigationItem()
        navigationItem.title = "Create A Room"
        
        // Create back button
        let backButton =  UIBarButtonItem(title: "Back", style:   UIBarButtonItemStyle.Plain, target: self, action: "goBack:")
        navigationItem.leftBarButtonItem = backButton
        navBar.items = [navigationItem]
        self.view.addSubview(navBar)
        
        
        roomNameTextField.frame = CGRect(x: Constants.centerHorizontally(Constants.labelWidth), y: Constants.screenHeight*1/4, width: Constants.labelWidth, height: Constants.labelHeight)
        roomNameTextField.placeholder = "Enter Room Name"
        roomNameTextField.textAlignment = .Center
        self.view.addSubview(roomNameTextField)
        
        
        passwordTextField.frame = CGRect(x: Constants.centerHorizontally(Constants.labelWidth), y: CGRectGetMaxY(roomNameTextField.frame), width: Constants.labelWidth, height: Constants.labelHeight)
        passwordTextField.placeholder = "Password (Optional)"
        passwordTextField.textAlignment = .Center
        self.view.addSubview(passwordTextField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goBack(sender: UIBarButtonItem) {
        
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
