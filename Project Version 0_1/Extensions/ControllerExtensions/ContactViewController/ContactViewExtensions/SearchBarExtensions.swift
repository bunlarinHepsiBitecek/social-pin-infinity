//
//  SearchBarExtensions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 2/24/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

extension ContactsNewViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        friendsData.userSearchResultFriendList.removeAll()
        
        if !searchText.isEmpty {
            
            for item in friendsData.userFriendsDictionary {
                
                var splitArray = [Substring]()
                
                print("item.userFriendChildData.userName.lowercased() : \(item.userFriendChildData.userName.lowercased())")
                
                splitArray = item.userFriendChildData.userName.split(separator: " ")
                
                for itemSplitted in splitArray {
                    
                    print("itemSplitted : \(itemSplitted)")
                    
                    if itemSplitted.lowercased().hasPrefix(searchBar.text!.lowercased()) {
                        
                        friendsData.userSearchResultFriendList.append(item)
                        break
                        
                    }
                }
            }
            
            isSearching = true
            
            searchBar.setShowsCancelButton(true, animated: true)
            
            containerViewForFriendsTab?.setfriendsTableViewScrolling(inputValue: false)
            
            boolArray.removeAll()
            
        } else {
            
            print("search is empty now")
            
            containerViewForFriendsTab?.setfriendsTableViewScrolling(inputValue: true)
            
            isSearching = false
            boolArray = Array(repeating: Array(repeating: false, count: friendsData.userFriendsDictionary.count), count: 30)
            
            searchBar.setShowsCancelButton(false, animated: true)
            
        }
        
        containerViewForFriendsTab?.isSearching = isSearching
        
        containerViewForFriendsTab?.tableViewFriends.reloadData()
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        print("searchBarCancelButtonClicked starts")
        
        searchBar.text?.removeAll()
        
        containerViewForFriendsTab?.setfriendsTableViewScrolling(inputValue: true)
        
        isSearching = false
        boolArray = Array(repeating: Array(repeating: false, count: friendsData.userFriendsDictionary.count), count: 30)
        
        searchBar.setShowsCancelButton(false, animated: true)
        
        containerViewForFriendsTab?.isSearching = isSearching
        containerViewForFriendsTab?.tableViewFriends.reloadData()
        
        //self.friendsTableView.reloadData()
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        print("searchBarSearchButtonClicked starts")
        
        self.searchBar.resignFirstResponder()
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        print("searchBarTextDidEndEditing starts")
        
        self.searchBar.showsCancelButton = true
        
        self.searchBar.endEditing(true)
        
    }
    
    
}
