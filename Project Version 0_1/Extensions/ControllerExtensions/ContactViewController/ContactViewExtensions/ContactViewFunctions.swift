//
//  ContactViewFunctions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 2/24/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

extension ContactsNewViewController {

    func setSearhBarProperties() {
        
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        
        textFieldInsideSearchBar?.textColor = UIColor.black
        textFieldInsideSearchBar?.backgroundColor = UIColor.lightGray
        
        searchBar.searchBarStyle = .minimal
        
    }
    
    func setTotalFriendCount() {
        
        totalFriendCount.text = String(friendsData.userFriendsDictionarySorted.count)
        
    }
    
    // make visible total count of selected friend on contactsNewViewController
    func encolorTotalSelectedFriendField(inputSelectedFriendCount : Int) {
    
        countForSelectedFriend = inputSelectedFriendCount
        
        UIView.transition(with: selectedFriendCount, duration: 0.3, options: .transitionCrossDissolve, animations: {
            
            self.selectedFriendCount.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            self.totalFriendCount.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            self.slachCharacter.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            self.selectedFriendCount.text = String(self.countForSelectedFriend)
            
        }) { (result) in
            
            print("result : \(result)")
            
        }
        
    }
    
    // make invisible total count of selected friend on contactsNewViewController
    func decolorizeTotalSelectedFriendField(inputSelectedFriendCount : Int) {
        
        countForSelectedFriend = inputSelectedFriendCount
        
        if countForSelectedFriend == 0 {
            
            UIView.transition(with: selectedFriendCount, duration: 0.3, options: .transitionCrossDissolve, animations: {
                
                self.selectedFriendCount.textColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
                
            }) { (result) in
                
                print("result : \(result)")
                
            }
            
            UIView.transition(with: totalFriendCount, duration: 0.3, options: .transitionCrossDissolve, animations: {
                
                self.totalFriendCount.textColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
                
            }) { (result) in
                
                print("result : \(result)")
                
            }
            
            UIView.transition(with: slachCharacter, duration: 0.3, options: .transitionCrossDissolve, animations: {
                
                self.slachCharacter.textColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
                
            }) { (result) in
                
                print("result : \(result)")
                
            }
            
            
            self.selectedFriendCount.text = String(self.countForSelectedFriend)
            
        } else {
            
            selectedFriendCount.text = String(countForSelectedFriend)
            
        }
        
    }
    
    func setInitialSegmentPropertiesForContainerViewPresentations() {
        
        switch returnSegmentedControlChoise() {
        case .friends, .groupCreation:
            
            startAnimationOfContainerViews(inputContainerViewChoise: .containerViewFriend)
            
        case .groups:
            
            startAnimationOfContainerViews(inputContainerViewChoise: .containerViewGroup)
            
        case .nothing:
            
            print("There is nothing to do")

        }
        
    }
    
    func startAnimationOfContainerViews(inputContainerViewChoise : EnumContainerView) {
        
        switch inputContainerViewChoise {
        case .containerViewFriend:
        
            UIView.animate(withDuration: 0.5, animations: {
                
                self.containerViewObjectForFriends.alpha = 1.0
                self.containerViewObjectForGroups.alpha = 0.0
                
            })
            
        case .containerViewGroup:
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.containerViewObjectForFriends.alpha = 0.0
                self.containerViewObjectForGroups.alpha = 1.0
                
            })
            
        }

    }
    
    func notificationCenterGettingInformedFromGroupCreation() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadAfterDeletingItemsFromGroupCreation), name: NSNotification.Name(rawValue: "load"), object: nil)
        
    }
    
    @objc func reloadAfterDeletingItemsFromGroupCreation() {
        
        print("reloadAfterDeletingItemsFromGroupCreation starts")
        
        if friendsData.isAnyFriendDeletedFromGroupCreationView {
            
            containerViewForFriendsTab?.collectionViewSelectedFriends.reloadData()
            containerViewForFriendsTab?.tableViewFriends.reloadData()
            
            //selectedFriendsCollectionView.reloadData()
            //friendsTableView.reloadData()
            
            countForSelectedFriend = selectedFriendArray.count
            
            selectedFriendCount.text = String(countForSelectedFriend)
            
            friendsData.isAnyFriendDeletedFromGroupCreationView = false
            
            //selectedFriendCollectionViewManagement()
            
            containerViewForFriendsTab?.selectedFriendCollectionViewManagement()
            
        }
        
    }
    
}

