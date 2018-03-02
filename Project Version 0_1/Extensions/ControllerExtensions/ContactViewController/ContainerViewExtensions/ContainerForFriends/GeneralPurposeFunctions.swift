//
//  GeneralPurposeFunctions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 3/1/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

extension ContainerFriendsTableViewController {
    
    func arrangeFrameSizeOfTableView() {
        
        self.tableViewFriends.frame = CGRect(x: self.tableViewFriends.frame.origin.x, y: self.tableViewFriends.frame.origin.y - self.collectionViewSelectedFriends.frame.height, width: self.tableViewFriends.frame.width, height: self.tableViewFriends.frame.height + self.collectionViewSelectedFriends.frame.height)
        
    }
    
    func setCollectionViewHiddenValue(inputBooleanValue : Bool) {
        
        collectionViewSelectedFriends.isHidden = inputBooleanValue
        
    }
    
    func setTableViewProperties() {
        
        tableViewFriends.allowsMultipleSelection = true
        tableViewFriends.sectionIndexColor = UIColor.red
        
    }
    
    func selectedFriendCollectionViewManagement() {
        
        if friendsData.userSelectedFriendsCollectionViewData.count > 0 {
            
            openSelectedFriendCollectionView()
            
        } else {
            
            closeSelectedFriendCollectionView()
        }
        
    }
    
    func openSelectedFriendCollectionView() {
        
        if !isCollectionViewOpen {
            
            UIView.transition(with: collectionViewSelectedFriends, duration: 0.3, options: .transitionCrossDissolve, animations: {
                
                self.collectionViewSelectedFriends.isHidden = false
                
                self.tableViewFriends.frame = CGRect(x: self.tableViewFriends.frame.origin.x, y: self.tableViewFriends.frame.origin.y + self.collectionViewSelectedFriends.frame.height, width: self.tableViewFriends.frame.width, height: self.tableViewFriends.frame.height - self.collectionViewSelectedFriends.frame.height)
                
            }) { (result) in
                
                print("result : \(result)")
                
            }
            
            isCollectionViewOpen = true
            
        }
        
    }
    
    func closeSelectedFriendCollectionView() {
        
        if isCollectionViewOpen {
            
            UIView.transition(with: collectionViewSelectedFriends, duration: 0.3, options: .transitionCrossDissolve, animations: {
                
                self.collectionViewSelectedFriends.isHidden = true
                
                self.tableViewFriends.frame = CGRect(x: self.tableViewFriends.frame.origin.x, y: self.tableViewFriends.frame.origin.y - self.collectionViewSelectedFriends.frame.height, width: self.tableViewFriends.frame.width, height: self.tableViewFriends.frame.height + self.collectionViewSelectedFriends.frame.height)
                
            }) { (result) in
                
                print("result : \(result)")
                
            }
            
            isCollectionViewOpen = false
            
        }
        
    }
    
    func setfriendsTableViewScrolling(inputValue : Bool) {
        
        tableViewFriends.showsVerticalScrollIndicator = inputValue
        
    }
    
}
