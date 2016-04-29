//
//  MainViewController.swift
//  SCloudNine
//
//  Created by Eddy Kim on 4/24/16.
//  Copyright © 2016 iOSDecal. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UITabBarController {
    var onGroupPage : Bool = false
    var onSearchPage : Bool = true
    var onPlaylistPage : Bool = false
    var groupTabItem = UITabBarItem()
    var searchTabItem = UITabBarItem()
    var playlistTabItem = UITabBarItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create all the tabs and connect it to the view controller.
        let groupTab : GroupViewController = GroupViewController()
        let searchTab : SearchViewController = SearchViewController()
        let playlistTab : PlaylistViewController = PlaylistViewController()
        let tabs = [groupTab, searchTab, playlistTab]
        self.viewControllers = tabs

        // Create the tab bar.
        // let tabBar : UITabBar = UITabBar()
        self.tabBar.barTintColor = UIColor(red: 0.176, green: 0.188, blue: 0.2, alpha: 1)
        // Color of the image when you click on it.
        // tabBar.tintColor = UIColor(red: 1, green: 0.545, blue: 0, alpha: 1)
        self.tabBar.tintColor = UIColor.blackColor()
        self.tabBar.translucent = false
        
        // Create the tabs on the tab bar.
        self.tabBar.itemWidth = Constants.screenWidth/3
        groupTabItem = UITabBarItem(title: "group", image: nil, tag: 0)
        groupTabItem.setFAIcon(FAType.FAUsers)
        searchTabItem = UITabBarItem(title: "search", image: nil, tag: 1)
        searchTabItem.setFAIcon(FAType.FASearch)
        playlistTabItem = UITabBarItem(title: "playlist", image: nil, tag: 2)
        playlistTabItem.setFAIcon(FAType.FAMusic)
        groupTab.tabBarItem = groupTabItem
        searchTab.tabBarItem = searchTabItem
        playlistTab.tabBarItem = playlistTabItem
        self.selectedIndex = 1
                
    }
    
    // Changes boolean values of page user is on when a tab is clicked.
//    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
//        if item.isEqual(groupTabItem) {
//            onGroupPage = true
//            onSearchPage = false
//            onPlaylistPage = false
//            print([onGroupPage, onSearchPage, onPlaylistPage])
//        } else if item.isEqual(searchTabItem) {
//            onGroupPage = false
//            onSearchPage = true
//            onPlaylistPage = false
//            print([onGroupPage, onSearchPage, onPlaylistPage])
//        } else if item.isEqual(playlistTabItem) {
//            onGroupPage = false
//            onSearchPage = false
//            onPlaylistPage = true
//            print([onGroupPage, onSearchPage, onPlaylistPage])
//        }
//        
//        // Load the correct tab.
//        loadTab();
//
//    }
        

}