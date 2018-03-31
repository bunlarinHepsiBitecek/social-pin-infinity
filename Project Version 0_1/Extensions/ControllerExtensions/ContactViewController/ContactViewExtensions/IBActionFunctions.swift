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
    
    func returnSegmentedControlChoise() -> EnumSegmentedChoise {
        
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
        
        switch returnSegmentedControlChoise() {
        case .friends:
            
            print("NextButtonTapped : friends")
            
            if let destinationViewController = UIStoryboard(name: ViewConstants.StoryBoard.HomePage, bundle: nil).instantiateViewController(withIdentifier: ViewConstants.StoryBoardIdentifiers.PhotoPicker3ViewController_storyBoardID) as? PhotoPicker3ViewController {
                
                present(destinationViewController, animated: true, completion: nil)
                
            }
        
        case .groups:
            
            print("NextButtonTapped : groups")
            
            if let destinationViewController = UIStoryboard(name: ViewConstants.StoryBoard.HomePage, bundle: nil).instantiateViewController(withIdentifier: ViewConstants.StoryBoardIdentifiers.PhotoPicker4ViewController_storyBoardID) as? PhotoPicker4ViewController {
                
                present(destinationViewController, animated: true, completion: nil)
                
            }
            
        case .groupCreation:
            
            print("NextButtonTapped : groupCreation")
            
            initiateGroupCreationProcess()
            
        case .nothing:
            
            print("NextButtonTapped : nothing")
            
        }
        
    }
    
    func changeNextButtonTextValue() {
        
        print("changeNextButtonTextValue starts")
        
        switch returnSegmentedControlChoise() {
        case .friends, .groups, .nothing:
            
            nextButton.changePlainButtonFontAndTitle(inputStringTitle: "Add", inputFontSize: 22.0)
            
        case .groupCreation:
            
            nextButton.changePlainButtonFontAndTitle(inputStringTitle: "Create Group", inputFontSize: 7.0)
            
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
    
    func changeColorOfTotalSelectedFriendBasedOnSegmentedButtonChoise() {
        
        switch returnSegmentedControlChoise() {
        case .friends, .groupCreation, .nothing:
            
            encolor()
            
        case .groups:
            
            decolorize()
            
        }
        
    }
    
    func encolor() {
        
        UIView.transition(with: selectedFriendCount, duration: 0.3, options: .transitionCrossDissolve, animations: {
            
            self.selectedFriendCount.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            self.totalFriendCount.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            self.slachCharacter.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
        })
        
    }
    
    func decolorize() {
        
        UIView.transition(with: selectedFriendCount, duration: 0.3, options: .transitionCrossDissolve, animations: {
            
            self.selectedFriendCount.textColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
            self.totalFriendCount.textColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
            self.slachCharacter.textColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
            
        })
    }
    
}