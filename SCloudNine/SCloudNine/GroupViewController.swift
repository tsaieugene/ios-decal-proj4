//
//  GroupViewController.swift
//  SCloudNine
//
//  Created by Eddy Kim on 4/24/16.
//  Copyright © 2016 iOSDecal. All rights reserved.
//

import Foundation
import UIKit
import MultipeerConnectivity

class GroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MCBrowserViewControllerDelegate, MCSessionDelegate {
    var createButton = UIButton()
    var joinButton = UIButton()
    var welcomeMessage = UILabel()
    let createRoomVC = CreateRoomViewController()
    let joinRoomVC = JoinRoomViewController()
    var groupMembersView: UITableView = UITableView()
    var logo = UIImageView()
    var leaveRoomAlert = UIAlertController()
//    var browser = LookForRoomsToJoinViewController()
    var peerID : MCPeerID!
    var session : MCSession!
    var advertisingAssistant : MCAdvertiserAssistant!
    var browser : MCBrowserViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up MCP
        peerID = MCPeerID(displayName: UIDevice.currentDevice().name)
        session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .Required)
        session.delegate = self
        browser = MCBrowserViewController(serviceType: "scloud-9", session: session)
//        browser.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
//        self.view.addSubview(browser.view)
        //        print(browser.view.subviews.count)
        //        for views in browser.view.subviews {
        //            print(String(views))
        //        }
//        startHosting()
        
        view.backgroundColor = UIColor(red: 0.914, green: 0.918, blue: 0.918, alpha: 1)
        // Create the logo.
        let logoFrame = CGRect(x: Constants.centerHorizontally(Constants.logoWidth), y: Constants.screenHeight*1/20, width: Constants.logoWidth, height: Constants.logoHeight)
        logo = UIImageView(image: UIImage(named: "SCloudNine_login"))
        logo.frame = logoFrame
        logo.contentMode = UIViewContentMode.ScaleAspectFill
        view.addSubview(logo)

        // Create the welcome message
        welcomeMessage.frame = CGRect(x: Constants.centerHorizontally(Constants.labelWidth), y: CGRectGetMaxY(logoFrame) - 80, width: Constants.labelWidth, height: Constants.labelHeight)
        welcomeMessage.text = "Create or join a room to get started!"
        welcomeMessage.textAlignment = .Center
        self.view.addSubview(welcomeMessage)
        
        // Create the Create Room Button
        createButton.frame = CGRect(x: Constants.centerHorizontally(Constants.labelWidth), y: CGRectGetMaxY(welcomeMessage.frame) + 5, width: Constants.labelWidth, height: Constants.labelHeight)

        createButton.backgroundColor = UIColor.orangeColor()
        createButton.layer.cornerRadius = 50
        createButton.layer.borderWidth = 1
        createButton.layer.borderColor = UIColor.blackColor().CGColor
        createButton.setTitle("Create Room", forState: UIControlState.Normal)
        createButton.addTarget(self, action: "createRoom", forControlEvents: UIControlEvents.TouchUpInside)
        createButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.view.addSubview(createButton)
        
        // Create Join Button
        joinButton.frame = CGRect(x: Constants.centerHorizontally(Constants.labelWidth), y: CGRectGetMaxY(createButton.frame) + 10, width: Constants.labelWidth, height: Constants.labelHeight)
        joinButton.layer.cornerRadius = 50
        joinButton.layer.borderWidth = 1
        joinButton.layer.borderColor = UIColor.blackColor().CGColor
        joinButton.backgroundColor = UIColor.orangeColor()
        joinButton.setTitle("Join a Room", forState: .Normal)
        joinButton.addTarget(self, action: "joinRoom", forControlEvents: .TouchUpInside)
        joinButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.view.addSubview(joinButton)
        
        
        // Setting up the tableView
        groupMembersView = UITableView(frame: CGRectMake(0, Constants.tabBarHeight, Constants.screenWidth, Constants.screenHeight), style: .Plain)
        groupMembersView.backgroundColor = UIColor(red: 0.914, green: 0.918, blue: 0.918, alpha: 1)

        
        groupMembersView.delegate = self
        groupMembersView.dataSource = self
        groupMembersView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "members")
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if (MainViewController.roomInfo.count != 0) {
            clearCurrentView()
            makeRoomExistsView()
            groupMembersView.reloadData()
            self.view.addSubview(self.groupMembersView)
        }
    }
    
    
    
    // Enable swipe to remove members from room, but host cant remove themselves
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle,forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            if indexPath.row != 0 {
                MainViewController.roomMembers.removeAtIndex(indexPath.row)
                groupMembersView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            } else {
                let cantRemoveSelfAlert = UIAlertController(title: "You can't Leave", message: "You cannot remove yourself from a room you are hosting!", preferredStyle: .Alert)
                cantRemoveSelfAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action) -> Void in cantRemoveSelfAlert.dismissViewControllerAnimated(true, completion: nil)
                }))
                self.presentViewController(cantRemoveSelfAlert, animated: true, completion: nil)
            }
        }
    }
    
    
    // Number of rows in table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainViewController.roomMembers.count
    }
    
    // Form contents of each row in the table
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let members: UITableViewCell = UITableViewCell(style: .Subtitle, reuseIdentifier: "members")
        members.textLabel!.text = MainViewController.roomMembers[indexPath.row]
        members.backgroundColor = UIColor(red: 0.914, green: 0.918, blue: 0.918, alpha: 1)

        return members
    }
    
    
    

    // clears the current view
    func clearCurrentView() {
        for view in self.view.subviews{
            view.removeFromSuperview()
        }
    }
    
    // creates the view for when a room exists
    func makeRoomExistsView() {
        // Make UI for room exists view, not used unless room is created
        // Create navigation bar
        let navBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.size.width, Constants.navBarHeight))
        
        
        // Create a navigation item with a title
        let navigationItem = UINavigationItem()
        navigationItem.title = MainViewController.roomInfo[0]
        
        
        // Create back button
        let leaveButton =  UIBarButtonItem(title: "Leave", style:   UIBarButtonItemStyle.Plain, target: self, action: "presentLeaveRoomAlert")
        navigationItem.leftBarButtonItem = leaveButton
        navBar.items = [navigationItem]
        
        //Create create button
        let inviteButton = UIBarButtonItem(title: "Invite", style: UIBarButtonItemStyle.Plain, target: self, action: "invitePerson")
        navigationItem.rightBarButtonItem = inviteButton
        navBar.items = [navigationItem]
        self.view.addSubview(navBar)
        
        //Creates tableview to present the members of the group, swipe to delete.
    }
    
    
    // creates view for when no room exists
    func makeNoRoomExistsView() {
        self.view.addSubview(logo)
        self.view.addSubview(welcomeMessage)
        self.view.addSubview(createButton)
        self.view.addSubview(joinButton)
    }
    
    
    
    
    
    
    
    
//    func session(session: MCSession, didReceiveData data: NSData, fromPeer peerID: MCPeerID) {
//        print("receiving")
//    }
//    
//    func session(session: MCSession, didReceiveStream stream: NSInputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
//        print("streaming")
//    }
//    
//    func session(session: MCSession, didReceiveCertificate certificate: [AnyObject]?, fromPeer peerID: MCPeerID, certificateHandler: (Bool) -> Void) {
//        print("certified")
//    }
//    
//    func session(session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, withProgress progress: NSProgress) {
//        print("gimme them resources")
//    }
//    
//    func session(session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, atURL localURL: NSURL, withError error: NSError?) {
//        print("i finished")
//    }
//    
//    func session(session: MCSession, peer peerID: MCPeerID, didChangeState state: MCSessionState) {
//        switch state {
//        case .Connected:
//            print("Connected")
//        case .Connecting:
//            print("Connecting")
//        case .NotConnected:
//            print("Not Connected")
//        }
//    }
//    
//    func browserViewControllerDidFinish(browserViewController: MCBrowserViewController) {
//        dismissViewControllerAnimated(true, completion: nil)
//    }
//    
//    func browserViewControllerWasCancelled(browserViewController: MCBrowserViewController) {
//        dismissViewControllerAnimated(true, completion: nil)
//    }
//
//    
    
    ///////////////// BUTTON ACTIONS /////////////////////////
    
    //Alert when trying to leave a room
    

    
    
    func presentLeaveRoomAlert() {
//        leaveRoomAlert = UIAlertController(title: "Leaving Room", message: "Are you sure you want to leave this room?", preferredStyle: .Default)
//        leaveRoomAlert.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { (action) -> Void in leaveRoomAlert.dismissViewControllerAnimated(true, completion: "leaveRoom")
//        }))
        leaveRoom()
    }
    
    
    // leaves current room and update view accordingly
    func leaveRoom() {
        MainViewController.roomInfo.removeAll()
        MainViewController.roomMembers.removeAll()
        clearCurrentView()
        makeNoRoomExistsView()
        groupMembersView.reloadData()
    }
    
    // takes you to page to invite someone to room
    func invitePerson() {
        self.presentViewController(InviteToRoomViewController(), animated: true, completion: nil)
        groupMembersView.reloadData()
    }
    
    // leads to another VC where rooms can be joined
    func joinRoom() {
//        startHosting()
        self.presentViewController(JoinRoomViewController(), animated: true, completion: nil)
        groupMembersView.reloadData()
    }
    
    // leads to another VC where room can be created
    func createRoom() {
        self.presentViewController(createRoomVC, animated: true, completion: nil)
        groupMembersView.reloadData()
    }

    
    

    
    
    
    // CONNECTIVITY STUFF
    
    
    
    
    
    
    func session(session: MCSession, didReceiveData data: NSData, fromPeer peerID: MCPeerID) {
        print("receiving")
    }
    
    func session(session: MCSession, didReceiveStream stream: NSInputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        print("streaming")
    }
    
    func session(session: MCSession, didReceiveCertificate certificate: [AnyObject]?, fromPeer peerID: MCPeerID, certificateHandler: (Bool) -> Void) {
        print("certified")
    }
    
    func session(session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, withProgress progress: NSProgress) {
        print("gimme them resources")
    }
    
    func session(session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, atURL localURL: NSURL, withError error: NSError?) {
        print("i finished")
    }
    
    func session(session: MCSession, peer peerID: MCPeerID, didChangeState state: MCSessionState) {
        switch state {
        case .Connected:
            print("Connected")
        case .Connecting:
            print("Connecting")
        case .NotConnected:
            print("Not Connected")
        }
    }
    
    func browserViewControllerDidFinish(browserViewController: MCBrowserViewController) {
        print("hi")
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func browserViewControllerWasCancelled(browserViewController: MCBrowserViewController) {
        print("ye")
        presentViewController(GroupViewController(), animated: true, completion: nil)
    }
    
    
    func startHosting() {
        advertisingAssistant = MCAdvertiserAssistant(serviceType: "SCL", discoveryInfo: nil, session: session)
        advertisingAssistant.start()
        print("im hosting")
    }
    
    
}


