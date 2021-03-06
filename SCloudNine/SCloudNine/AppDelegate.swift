//
//  AppDelegate.swift
//  SCloudNine
//
//  Created by Eddy Kim on 4/23/16.
//  Copyright © 2016 iOSDecal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window!.backgroundColor = UIColor.whiteColor()
        window!.rootViewController = ViewController()
        window!.makeKeyAndVisible()
        return true
    }
    
    
}
