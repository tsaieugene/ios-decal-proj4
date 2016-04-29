//
//  GroupViewController.swift
//  SCloudNine
//
//  Created by Eddy Kim on 4/24/16.
//  Copyright © 2016 iOSDecal. All rights reserved.
//

import Foundation
import UIKit

class GroupViewController: UIViewController {
    var createButton = UIButton()
    var joinButton = UIButton()
    let createRoomVC = CreateRoomViewController()
    let joinRoomVC = JoinRoomViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create the Create Room Button
        createButton.frame = CGRect(x: Constants.centerHorizontally(Constants.labelWidth), y: Constants.screenHeight*1/4 + 5, width: Constants.labelWidth, height: Constants.labelHeight)
        createButton.backgroundColor = UIColor.orangeColor()
        createButton.setTitle("Create Room", forState: UIControlState.Normal)
        createButton.addTarget(self, action: "createRoom", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(createButton)
        
        // Create Join Button
        joinButton.frame = CGRect(x: Constants.centerHorizontally(Constants.labelWidth), y: CGRectGetMaxY(createButton.frame) + 5, width: Constants.labelWidth, height: Constants.labelHeight)
        joinButton.backgroundColor = UIColor.orangeColor()
        joinButton.setTitle("Join a Room", forState: .Normal)
        joinButton.addTarget(self, action: "joinRoom", forControlEvents: .TouchUpInside)
        self.view.addSubview(joinButton)
    }
    
    
    func createRoom() {
        self.presentViewController(createRoomVC, animated: true, completion: nil)
        
    }
    
    func joinRoom() {
        self.presentViewController(joinRoomVC, animated: true, completion: nil)
        
    }
}