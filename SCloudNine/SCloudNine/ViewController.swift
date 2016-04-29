//
//  ViewController.swift
//  SCloudNine
//
//  Created by Eddy Kim on 4/23/16.
//  Copyright © 2016 iOSDecal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Creates the main view controller of the app.
    let tabController : MainViewController = MainViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLoginPage()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if Constants.loggedIn {
            self.presentViewController(tabController, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Loads the login page.
    func loadLoginPage() {
        view.backgroundColor = UIColor(red: 0.914, green: 0.918, blue: 0.918, alpha: 1)
        
        // Create the logo.
        let logoFrame = CGRect(x: Constants.centerHorizontally(Constants.logoWidth), y: Constants.screenHeight - (Constants.screenHeight*9/10), width: Constants.logoWidth, height: Constants.logoHeight)
        let logo = UIImageView(image: UIImage(named: "SCloudNine_login"))
        logo.frame = logoFrame
        view.addSubview(logo)
        
        // Create the label.
        let appDescription = UILabel()
        let appDescriptionFrame = CGRect(x: Constants.centerHorizontally(Constants.labelWidth), y: 10 + CGRectGetMaxY(logoFrame), width: Constants.labelWidth, height: Constants.labelHeight)
        appDescription.frame = appDescriptionFrame
        appDescription.text = "A place to build a playlist together with your friends."
        appDescription.numberOfLines = 5
        appDescription.textAlignment = NSTextAlignment.Center
        view.addSubview(appDescription)
        
        // Add authentication button.
        let loginButton = UIButton()
        let loginButtonFrame = CGRect(x: Constants.centerHorizontally(Constants.loginButtonWidth), y: 5 + CGRectGetMaxY(appDescriptionFrame), width: Constants.loginButtonWidth, height: Constants.loginButtonHeight)
        loginButton.frame = loginButtonFrame
        loginButton.setImage(UIImage(named: "connectWithSoundCloudImage"), forState: UIControlState.Normal)
        loginButton.addTarget(self, action: #selector(ViewController.loginButtonPressed(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(loginButton)
        
    }
    
    // Takes user to authentication/login page.
    func loginButtonPressed(sender: UIButton!) {
        self.presentViewController(tabController, animated: true, completion: nil)
    }


}

