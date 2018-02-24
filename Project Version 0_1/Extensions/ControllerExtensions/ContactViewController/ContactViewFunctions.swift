//
//  ContactViewFunctions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 2/24/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

extension ContactsNewViewController {
    
    func setfriendsTableViewScrolling(inputValue : Bool) {
        
        friendsTableView.showsVerticalScrollIndicator = inputValue
        
    }
   
    @objc func reloadAfterDeletingItemsFromGroupCreation() {
        
        print("reloadAfterDeletingItemsFromGroupCreation starts")
        
        if friendsData.isAnyFriendDeletedFromGroupCreationView {
            
            selectedFriendsCollectionView.reloadData()
            friendsTableView.reloadData()
            
            countForSelectedFriend = selectedFriendArray.count
            
            selectedFriendCount.text = String(countForSelectedFriend)
            
            friendsData.isAnyFriendDeletedFromGroupCreationView = false
            
            selectedFriendCollectionViewManagement()
            
        }
        
    }
    
    func setSearhBarProperties() {
        
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        
        textFieldInsideSearchBar?.textColor = UIColor.black
        textFieldInsideSearchBar?.backgroundColor = UIColor.lightGray
        
        searchBar.searchBarStyle = .minimal
        
    }
    
    func setTotalFriendCount() {
        
        totalFriendCount.text = String(friendsData.userFriendsDictionarySorted.count)
        
    }
    
    func notificationCenterGettingInformedFromGroupCreation() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadAfterDeletingItemsFromGroupCreation), name: NSNotification.Name(rawValue: "load"), object: nil)
        
    }
    
    func arrangeFrameSizeOfTableView() {
        
        self.friendsTableView.frame = CGRect(x: self.friendsTableView.frame.origin.x, y: self.friendsTableView.frame.origin.y - self.selectedFriendsCollectionView.frame.height, width: self.friendsTableView.frame.width, height: self.friendsTableView.frame.height + self.selectedFriendsCollectionView.frame.height)
        
        
    }

    func setCollectionViewHiddenValue(inputBooleanValue : Bool) {
        
        selectedFriendsCollectionView.isHidden = inputBooleanValue
        
    }
    
    func setTableViewProperties() {
        
        friendsTableView.allowsMultipleSelection = true
        friendsTableView.sectionIndexColor = UIColor.red
        
    }
    
    func loadFriendSelectedDictionary() {
        
        boolArray = Array(repeating: Array(repeating: false, count: friendsData.userFriendsDictionary.count), count: 30)
        
        for item in friendsData.userFriendsDictionarySorted {
            
            friendSelectedDictionary[item.userID] = false
            
        }
        
    }
    
}

