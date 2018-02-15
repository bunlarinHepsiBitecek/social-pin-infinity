//
//  IBActionFunctions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 10.02.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit
import Firebase

extension ContactsNewViewController {
    
    func returSegmentedControlChoise() -> EnumSegmentedChoise {
        
        if segmentedChoiceButton.selectedSegmentIndex == 0 {
            
            return EnumSegmentedChoise.friends
            
        } else if segmentedChoiceButton.selectedSegmentIndex == 1 {
            
            return EnumSegmentedChoise.groups
            
        } else if segmentedChoiceButton.selectedSegmentIndex == 2 {
            
            return EnumSegmentedChoise.groupCreation
            
        } else {
            
            return EnumSegmentedChoise.nothing
            
        }
        
    }
    
    func nextButtonProcessOnContactViewController() {
        
        switch returSegmentedControlChoise() {
        case .friends:
            
            print("NextButtonTapped : friends")
        
        case .groups:
            
            print("NextButtonTapped : groups")
            
        case .groupCreation:
            
            print("NextButtonTapped : groupCreation")
            
            initiateGroupCreationProcess()
            
        case .nothing:
            
            print("NextButtonTapped : nothing")
            
        }
        
    }
    
    func initiateGroupCreationProcess() {
        
        print("initiateGroupCreationProcess starts")
        
        let groupDatabaseObject = DatabaseGroup()
        
        let newGroup = Group()
        
        newGroup.adminUserID = user.userID
        
        let newUniqueIDforGroupID = groupDatabaseObject.getDatabaseReferenceGroups.childByAutoId()
        
        print("newUniqueIDforGroupID : \(newUniqueIDforGroupID)")
        print("newUniqueIDforGroupID : \(newUniqueIDforGroupID)")
        
        for friend in friendsData.selectedFriendForDatabaseOperations {
            
            print("friend.key : \(friend.key)")
            print("friend.value : \(friend.value.userFriendChildData.userName)")
            
        }
        
        if let destinationViewController = UIStoryboard(name: ViewConstants.StoryBoard.HomePage, bundle: nil).instantiateViewController(withIdentifier: ViewConstants.StoryBoardIdentifiers.GroupCreation2ViewController_storyBoardID) as? GroupCreation2ViewController {
            
            destinationViewController.user = self.user
            
            present(destinationViewController, animated: true, completion: nil)
            
        }
        
    }
    
}