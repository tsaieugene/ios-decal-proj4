//
//  LookForRoomsToJoinViewController.swift
//  SCloudNine
//
//  Created by Alex Huang on 5/1/16.
//  Copyright © 2016 iOSDecal. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class LookForRoomsToJoinViewController: UIViewController, MCBrowserViewControllerDelegate, MCSessionDelegate {
    
    let peerID = MCPeerID(displayName: UIDevice.currentDevice().name)
    var session : MCSession!
    var advertisingAssistant : MCAdvertiserAssistant!
    var browser : MCBrowserViewController!
    var nearbyBrowser: MCNearbyServiceBrowser!
    var nearbyAdvertiser : MCNearbyServiceAdvertiser!

    override func viewDidLoad() {
        super.viewDidLoad()
        session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .None)
        session.delegate = self

        browser = MCBrowserViewController(serviceType: "SCL", session: session)
//        browser.view.subviews[1].removeFromSuperview()

        browser.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.addSubview(browser.view)
//        print(browser.view.subviews.count)
//        for views in browser.view.subviews {
//            print(String(views))
//        }
        startHosting()
        
//        nearbyBrowser = MCNearbyServiceBrowser(peer: peerID, serviceType: "scloud")
//        nearbyBrowser.delegate = self
//        nearbyBrowser.startBrowsingForPeers()
//        
//        nearbyAdvertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: "scloud")
//        nearbyAdvertiser.delegate = self
//        nearbyAdvertiser.startAdvertisingPeer()
//        
//        
//        

        // Do any additional setup after loading the view.
    }
    
    
//    func browser(browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
//        print("gone")
//    }
//    
//    func browser(browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error: NSError) {
//        print("failed")
//    }
//    
//    func browser(browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
//        nearbyBrowser.invitePeer(peerID, toSession: session, withContext: nil, timeout: 10)
//    }
//    
//    func advertiser(advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: NSError) {
//        print("failed advertising")
//    }
//    
//    func advertiser(advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: NSData?, invitationHandler: (Bool, MCSession) -> Void) {
//        print("hi")
//        nearbyBrowser.invitePeer(peerID, toSession: session, withContext: nil, timeout: 5)
//    }
//    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
