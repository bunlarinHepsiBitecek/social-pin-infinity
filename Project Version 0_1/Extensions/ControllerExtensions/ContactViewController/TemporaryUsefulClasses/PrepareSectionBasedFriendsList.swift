//
//  PrepareSectionBasedFriendsList.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 2.02.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

/*
extension ContactsNewViewController {
    
    func createSectionsForFriendList() {
        
        print("createSectionsForFriendList starts")
        
        friendsData.sortDictionaryData()
        
        for userFriendObject in friendsData.userFriendsDictionarySorted {
            
            if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.A) {
                
                friendsData.friendListInitial_A.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.B){
                
                friendsData.friendListInitial_B.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.C) {
                
                friendsData.friendListInitial_C.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.D){
                
                friendsData.friendListInitial_D.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.E) {
                
                friendsData.friendListInitial_E.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.F){
                
                friendsData.friendListInitial_F.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.G) {
                
                friendsData.friendListInitial_G.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.H){
                
                friendsData.friendListInitial_H.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.I) {
                
                friendsData.friendListInitial_I.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.J){
                
                friendsData.friendListInitial_J.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.K) {
                
                friendsData.friendListInitial_K.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.L){
                
                friendsData.friendListInitial_L.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.M) {
                
                friendsData.friendListInitial_M.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.N){
                
                friendsData.friendListInitial_N.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.O) {
                
                friendsData.friendListInitial_O.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.P){
                
                friendsData.friendListInitial_P.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.Q) {
                
                friendsData.friendListInitial_Q.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.R) {
                
                friendsData.friendListInitial_R.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.S){
                
                friendsData.friendListInitial_S.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.T) {
                
                friendsData.friendListInitial_T.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.U){
                
                friendsData.friendListInitial_U.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.V) {
                
                friendsData.friendListInitial_V.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.W){
                
                friendsData.friendListInitial_W.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.X) {
                
                friendsData.friendListInitial_X.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.Y){
                
                friendsData.friendListInitial_Y.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.Z) {
                
                friendsData.friendListInitial_Z.append(userFriendObject)
                
            }
            
        }
        
        if friendsData.friendListInitial_A.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.A] = friendsData.friendListInitial_A
            
        }
        
        if friendsData.friendListInitial_B.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.B] = friendsData.friendListInitial_B
            
        }
        
        if friendsData.friendListInitial_C.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.C] = friendsData.friendListInitial_C
            
        }
        
        if friendsData.friendListInitial_D.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.D] = friendsData.friendListInitial_D
            
        }
        
        if friendsData.friendListInitial_E.count > 0 {
            
            print("e count : \(friendsData.friendListInitial_E.count)")
            
            friendsData.sectionDictionary[LetterConstants.E] = friendsData.friendListInitial_E
            
        }
        
        if friendsData.friendListInitial_F.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.F] = friendsData.friendListInitial_F
            
        }
        
        if friendsData.friendListInitial_G.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.G] = friendsData.friendListInitial_G
            
        }
        
        if friendsData.friendListInitial_H.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.H] = friendsData.friendListInitial_H
            
        }
        
        if friendsData.friendListInitial_I.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.I] = friendsData.friendListInitial_I
            
        }
        
        if friendsData.friendListInitial_J.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.J] = friendsData.friendListInitial_J
            
        }
        
        if friendsData.friendListInitial_K.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.K] = friendsData.friendListInitial_K
            
        }
        
        if friendsData.friendListInitial_L.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.L] = friendsData.friendListInitial_L
            
        }
        
        if friendsData.friendListInitial_M.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.M] = friendsData.friendListInitial_M
            
        }
        
        if friendsData.friendListInitial_N.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.N] = friendsData.friendListInitial_N
            
        }
        
        if friendsData.friendListInitial_O.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.O] = friendsData.friendListInitial_O
            
        }
        
        if friendsData.friendListInitial_P.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.P] = friendsData.friendListInitial_P
            
        }
        
        if friendsData.friendListInitial_Q.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.Q] = friendsData.friendListInitial_Q
            
        }
        
        if friendsData.friendListInitial_R.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.R] = friendsData.friendListInitial_R
            
        }
        
        if friendsData.friendListInitial_S.count > 0 {
            
            print("s count : \(friendsData.friendListInitial_S.count)")
            
            friendsData.sectionDictionary[LetterConstants.S] = friendsData.friendListInitial_S
            
        }
        
        if friendsData.friendListInitial_T.count > 0 {
            
            print("t count : \(friendsData.friendListInitial_T.count)")
            
            friendsData.sectionDictionary[LetterConstants.T] = friendsData.friendListInitial_T
            
        }
        
        if friendsData.friendListInitial_U.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.U] = friendsData.friendListInitial_U
            
        }
        
        if friendsData.friendListInitial_V.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.V] = friendsData.friendListInitial_V
            
        }
        
        if friendsData.friendListInitial_W.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.W] = friendsData.friendListInitial_W
            
        }
        
        if friendsData.friendListInitial_X.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.X] = friendsData.friendListInitial_X
            
        }
        
        if friendsData.friendListInitial_Y.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.Y] = friendsData.friendListInitial_Y
            
        }
        
        if friendsData.friendListInitial_Z.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.Z] = friendsData.friendListInitial_Z
            
        }
        
        friendsData.keyData = Array(friendsData.sectionDictionary.keys).sorted()
        
    }

    func calculateNumberOfSections(inputSectionValue : Int) -> Int {
        
        if friendsData.keyData[inputSectionValue] == LetterConstants.A {
            
            return friendsData.friendListInitial_A.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.B {
        
            return friendsData.friendListInitial_B.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.C {
            
            return friendsData.friendListInitial_C.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.D {
            
            return friendsData.friendListInitial_D.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.E {
            
            print("friendsData.friendListInitial_E.count : \(friendsData.friendListInitial_E.count)")
            return friendsData.friendListInitial_E.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.F {
            
            return friendsData.friendListInitial_F.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.G {
            
            return friendsData.friendListInitial_G.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.H {
            
            return friendsData.friendListInitial_H.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.I {
            
            return friendsData.friendListInitial_I.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.J {
            
            return friendsData.friendListInitial_J.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.K {
            
            return friendsData.friendListInitial_K.count
        
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.L {
            
            return friendsData.friendListInitial_L.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.M {
            
            return friendsData.friendListInitial_M.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.N {
            
            return friendsData.friendListInitial_N.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.O {
            
            return friendsData.friendListInitial_O.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.P {
            
            return friendsData.friendListInitial_P.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.Q {
            
            return friendsData.friendListInitial_Q.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.R {
            
            return friendsData.friendListInitial_R.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.S {
            
            return friendsData.friendListInitial_S.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.T {
            
            return friendsData.friendListInitial_T.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.U {
            
            return friendsData.friendListInitial_U.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.V {
            
            return friendsData.friendListInitial_V.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.W {
            
            return friendsData.friendListInitial_W.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.X {
            
            return friendsData.friendListInitial_X.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.Y {
            
            return friendsData.friendListInitial_Y.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.Z {
            
            return friendsData.friendListInitial_Z.count
            
        } else {
            
            return 0
            
        }
        
    }
    
    func arrangeSectionsInitialsBased(inputIndexPath : IndexPath) -> UserFriend {
        
        if inputIndexPath.section == 0 {
         
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 1 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 2 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 3 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 4 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 5 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 6 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 7 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 8 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 9 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 10 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 11 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 12 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 13 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 14 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 15 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 16 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 17 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 18 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 19 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 20 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 21 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 22 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 23 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 24 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 25 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 26 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else {
            
            return UserFriend()
            
        }

    }
    
    func openSelectedFriendCollectionView() {
        
        if !isCollectionViewOpen {
            
            UIView.transition(with: selectedFriendsCollectionView, duration: 0.3, options: .transitionCrossDissolve, animations: {
                
                self.selectedFriendsCollectionView.isHidden = false
                
                self.friendsTableView.frame = CGRect(x: self.friendsTableView.frame.origin.x, y: self.friendsTableView.frame.origin.y + self.selectedFriendsCollectionView.frame.height, width: self.friendsTableView.frame.width, height: self.friendsTableView.frame.height - self.selectedFriendsCollectionView.frame.height)
                
            }) { (result) in
                
                print("result : \(result)")
                
            }
            
            isCollectionViewOpen = true
            
        }
        
    }
    
    /*
    func closeSelectedFriendCollectionView() {
        
        if isCollectionViewOpen {
            
            UIView.transition(with: selectedFriendsCollectionView, duration: 0.3, options: .transitionCrossDissolve, animations: {
                
                self.selectedFriendsCollectionView.isHidden = true
                
                self.friendsTableView.frame = CGRect(x: self.friendsTableView.frame.origin.x, y: self.friendsTableView.frame.origin.y - self.selectedFriendsCollectionView.frame.height, width: self.friendsTableView.frame.width, height: self.friendsTableView.frame.height + self.selectedFriendsCollectionView.frame.height)
                
            }) { (result) in
                
                print("result : \(result)")
                
            }
            
            isCollectionViewOpen = false
            
        }
        
    }*/
    
    func selectedFriendCollectionViewManagement() {
        
        if friendsData.userSelectedFriendsCollectionViewData.count > 0 {
            
            openSelectedFriendCollectionView()
            
        } else {
            
            closeSelectedFriendCollectionView()
        }

    }
    
    func createSectionsForGroups() {
        
        for userGroupObject in constantUserGroupDataObject.userGroupSortedList {
            
            if userGroupObject.groupName.hasPrefix(LetterConstants.A) {
                
                constantUserGroupDataObject.groupListInitial_A.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.B){
                
                constantUserGroupDataObject.groupListInitial_B.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.C) {
                
                constantUserGroupDataObject.groupListInitial_C.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.D){
                
                constantUserGroupDataObject.groupListInitial_D.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.E) {
                
                constantUserGroupDataObject.groupListInitial_E.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.F){
                
                constantUserGroupDataObject.groupListInitial_F.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.G) {
                
                constantUserGroupDataObject.groupListInitial_G.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.H){
                
                constantUserGroupDataObject.groupListInitial_H.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.I) {
                
                constantUserGroupDataObject.groupListInitial_I.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.J){
                
                constantUserGroupDataObject.groupListInitial_J.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.K) {
                
                constantUserGroupDataObject.groupListInitial_K.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.L){
                
                constantUserGroupDataObject.groupListInitial_L.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.M) {
                
                constantUserGroupDataObject.groupListInitial_M.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.N){
                
                constantUserGroupDataObject.groupListInitial_N.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.O) {
                
                constantUserGroupDataObject.groupListInitial_O.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.P){
                
                constantUserGroupDataObject.groupListInitial_P.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.Q) {
                
                constantUserGroupDataObject.groupListInitial_Q.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.R) {
                
                constantUserGroupDataObject.groupListInitial_R.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.S){
                
                constantUserGroupDataObject.groupListInitial_S.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.T) {
                
                constantUserGroupDataObject.groupListInitial_T.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.U){
                
                constantUserGroupDataObject.groupListInitial_U.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.V) {
                
                constantUserGroupDataObject.groupListInitial_V.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.W){
                
                constantUserGroupDataObject.groupListInitial_W.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.X) {
                
                constantUserGroupDataObject.groupListInitial_X.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.Y){
                
                constantUserGroupDataObject.groupListInitial_Y.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.Z) {
                
                constantUserGroupDataObject.groupListInitial_Z.append(userGroupObject)
                
            }
            
        }
        
        if constantUserGroupDataObject.groupListInitial_A.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.A] = constantUserGroupDataObject.groupListInitial_A
            
        }
        
        if constantUserGroupDataObject.groupListInitial_B.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.B] = constantUserGroupDataObject.groupListInitial_B
            
        }
        
        if constantUserGroupDataObject.groupListInitial_C.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.C] = constantUserGroupDataObject.groupListInitial_C
            
        }
        
        if constantUserGroupDataObject.groupListInitial_D.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.D] = constantUserGroupDataObject.groupListInitial_D
            
        }
        
        if constantUserGroupDataObject.groupListInitial_E.count > 0 {
            
            print("e count : \(constantUserGroupDataObject.groupListInitial_E.count)")
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.E] = constantUserGroupDataObject.groupListInitial_E
            
        }
        
        if constantUserGroupDataObject.groupListInitial_F.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.F] = constantUserGroupDataObject.groupListInitial_F
            
        }
        
        if constantUserGroupDataObject.groupListInitial_G.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.G] = constantUserGroupDataObject.groupListInitial_G
            
        }
        
        if constantUserGroupDataObject.groupListInitial_H.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.H] = constantUserGroupDataObject.groupListInitial_H
            
        }
        
        if constantUserGroupDataObject.groupListInitial_I.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.I] = constantUserGroupDataObject.groupListInitial_I
            
        }
        
        if constantUserGroupDataObject.groupListInitial_J.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.J] = constantUserGroupDataObject.groupListInitial_J
            
        }
        
        if constantUserGroupDataObject.groupListInitial_K.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.K] = constantUserGroupDataObject.groupListInitial_K
            
        }
        
        if constantUserGroupDataObject.groupListInitial_L.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.L] = constantUserGroupDataObject.groupListInitial_L
            
        }
        
        if constantUserGroupDataObject.groupListInitial_M.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.M] = constantUserGroupDataObject.groupListInitial_M
            
        }
        
        if constantUserGroupDataObject.groupListInitial_N.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.N] = constantUserGroupDataObject.groupListInitial_N
            
        }
        
        if constantUserGroupDataObject.groupListInitial_O.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.O] = constantUserGroupDataObject.groupListInitial_O
            
        }
        
        if constantUserGroupDataObject.groupListInitial_P.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.P] = constantUserGroupDataObject.groupListInitial_P
            
        }
        
        if constantUserGroupDataObject.groupListInitial_Q.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.Q] = constantUserGroupDataObject.groupListInitial_Q
            
        }
        
        if constantUserGroupDataObject.groupListInitial_R.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.R] = constantUserGroupDataObject.groupListInitial_R
            
        }
        
        if constantUserGroupDataObject.groupListInitial_S.count > 0 {
            
            print("s count : \(constantUserGroupDataObject.groupListInitial_S.count)")
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.S] = constantUserGroupDataObject.groupListInitial_S
            
        }
        
        if constantUserGroupDataObject.groupListInitial_T.count > 0 {
            
            print("t count : \(constantUserGroupDataObject.groupListInitial_T.count)")
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.T] = constantUserGroupDataObject.groupListInitial_T
            
        }
        
        if constantUserGroupDataObject.groupListInitial_U.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.U] = constantUserGroupDataObject.groupListInitial_U
            
        }
        
        if constantUserGroupDataObject.groupListInitial_V.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.V] = constantUserGroupDataObject.groupListInitial_V
            
        }
        
        if constantUserGroupDataObject.groupListInitial_W.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.W] = constantUserGroupDataObject.groupListInitial_W
            
        }
        
        if constantUserGroupDataObject.groupListInitial_X.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.X] = constantUserGroupDataObject.groupListInitial_X
            
        }
        
        if constantUserGroupDataObject.groupListInitial_Y.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.Y] = constantUserGroupDataObject.groupListInitial_Y
            
        }
        
        if constantUserGroupDataObject.groupListInitial_Z.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.Z] = constantUserGroupDataObject.groupListInitial_Z
            
        }
        
        constantUserGroupDataObject.keyData = Array(constantUserGroupDataObject.sectionDictionaryForGroups.keys).sorted()
        
    }
    
    func calculateNumberOfSectionsForGroups(inputSectionValue : Int) -> Int {
        
        if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.A {
            
            return constantUserGroupDataObject.groupListInitial_A.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.B {
            
            return constantUserGroupDataObject.groupListInitial_B.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.C {
            
            return constantUserGroupDataObject.groupListInitial_C.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.D {
            
            return constantUserGroupDataObject.groupListInitial_D.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.E {
            
            print("constantUserGroupDataObject.groupListInitial_E.count : \(constantUserGroupDataObject.groupListInitial_E.count)")
            return constantUserGroupDataObject.groupListInitial_E.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.F {
            
            return constantUserGroupDataObject.groupListInitial_F.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.G {
            
            return constantUserGroupDataObject.groupListInitial_G.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.H {
            
            return constantUserGroupDataObject.groupListInitial_H.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.I {
            
            return constantUserGroupDataObject.groupListInitial_I.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.J {
            
            return constantUserGroupDataObject.groupListInitial_J.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.K {
            
            return constantUserGroupDataObject.groupListInitial_K.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.L {
            
            return constantUserGroupDataObject.groupListInitial_L.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.M {
            
            return constantUserGroupDataObject.groupListInitial_M.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.N {
            
            return constantUserGroupDataObject.groupListInitial_N.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.O {
            
            return constantUserGroupDataObject.groupListInitial_O.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.P {
            
            return constantUserGroupDataObject.groupListInitial_P.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.Q {
            
            return constantUserGroupDataObject.groupListInitial_Q.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.R {
            
            return constantUserGroupDataObject.groupListInitial_R.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.S {
            
            return constantUserGroupDataObject.groupListInitial_S.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.T {
            
            return constantUserGroupDataObject.groupListInitial_T.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.U {
            
            return constantUserGroupDataObject.groupListInitial_U.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.V {
            
            return constantUserGroupDataObject.groupListInitial_V.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.W {
            
            return constantUserGroupDataObject.groupListInitial_W.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.X {
            
            return constantUserGroupDataObject.groupListInitial_X.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.Y {
            
            return constantUserGroupDataObject.groupListInitial_Y.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.Z {
            
            return constantUserGroupDataObject.groupListInitial_Z.count
            
        } else {
            
            return 0
            
        }
        
    }
    
    func arrangeSectionDataForGroupSegment(inputIndexPath : IndexPath) -> Group {
        
        if inputIndexPath.section == 0 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
            
        } else if inputIndexPath.section == 1 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 2 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 3 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 4 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 5 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 6 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 7 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 8 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 9 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 10 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 11 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 12 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 13 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 14 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 15 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 16 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 17 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 18 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 19 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 20 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 21 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 22 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 23 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 24 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 25 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 26 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else {
            
            return Group()
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}*/