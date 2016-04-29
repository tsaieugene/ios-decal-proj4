//
//  SearchViewController.swift
//  SCloudNine
//
//  Created by Eddy Kim on 4/24/16.
//  Copyright © 2016 iOSDecal. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    var searchBar = UISearchBar()
    let searchResults = UIWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchBar.delegate = self
        
        // Create the search bar.
        searchBar.placeholder = "search"
        searchBar.returnKeyType = UIReturnKeyType.Search
        searchBar.enablesReturnKeyAutomatically = true

        searchBar.frame = CGRect(x: 0.0, y: 0.0, width: Constants.screenWidth, height: Constants.screenHeight * 0.1)
        self.view.addSubview(searchBar)
        
        // Create the webview that loads the search results from SoundCloud.
        searchResults.frame = CGRect(x: 0.0, y: searchBar.bounds.maxY, width: Constants.screenHeight, height: self.view.frame.size.height - Constants.screenHeight * 0.1)
        searchResults.tintColor = UIColor.purpleColor()
        view.addSubview(searchResults)
        
    }
    
    //Hides keyboard when tapped anywhere outside the keyboard.
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    // Searches SoundCloud for song.
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    
        // Here is where you search for the song from SoundCloud.
        
        let userInput = searchBar.text?.componentsSeparatedByString(" ")
        print(userInput)
        var scFormattedString = ""
        for i in 0 ..< userInput!.count {
            
        }
//        for index in 0...userInput?.count {
//            scFormattedString += parsedSearch![index]
//            if index != userInput!.count {
//                scFormattedString += "%20"
//            }
//        }
        
//        let searchString = "https://soundcloud.com/search?q=" + correctQueryFormat
//        let urlOfSearch = NSURL(string: searchString)
//        let request = NSURLRequest(URL: urlOfSearch!)
//        searchResults.loadRequest(request)
    }
    
    // Add song.
    // func addSong when user taps on a soundcloud song.
    // if Constants.inGroup {
    //      songsInPlaylist.add(song)
    // } else {
    //      alertNotInGroup()
    // }
    
    // Alert message when user tries to add songs and is not in a group.
    func alertNotInGroup() {
        let alertController = UIAlertController(
            title: "Can't add song to playlist",
            message: "You must be in a group before adding songs",
            preferredStyle: .Alert
        )
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}
