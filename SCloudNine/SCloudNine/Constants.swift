//
//  Constants.swift
//  SCloudNine
//
//  Created by Eddy Kim on 4/24/16.
//  Copyright © 2016 iOSDecal. All rights reserved.
//

import Foundation
import UIKit

struct Constants {

    // General width and height for any screen size.
    static let screenWidth : CGFloat = UIScreen.mainScreen().bounds.size.width
    static let screenHeight : CGFloat = UIScreen.mainScreen().bounds.size.height
    static var loggedIn : Bool = false
    static var inGroup : Bool = false
    
    // Constants for ViewController instances.
    static let logoWidth : CGFloat = 300.0
    static let logoHeight : CGFloat = 300.0
    static let labelWidth : CGFloat = 0.8 * screenWidth
    static let labelHeight : CGFloat = 100.0
    static let loginButtonWidth : CGFloat = 250.0
    static let loginButtonHeight : CGFloat = 30.0
    
    // Constants for MainViewController instances.
    static let tabBarWidth : CGFloat = screenWidth
    static let tabBarHeight : CGFloat = 0.1 * screenHeight
    static let tabItemWidth : CGFloat = 30.0
    static let tabItemHeight : CGFloat = 30.0
    static var onGroupPage : Bool = false
    static var onSearchPage : Bool = true
    static var onPlaylistPage : Bool = false
    
    static var songsInPlaylist = []
    
    // Gets the middle pixel in respect to the screen width and the object width
    static func centerHorizontally(objectSize: CGFloat) -> CGFloat {
        return screenWidth/2 - objectSize/2
    }
}


