//
//  HomePageServerExtensions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 25.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit
import Firebase

extension HomePageViewController {
    
    // aşağıdaki kod parçası geçici olarak koyuldu
    func getUserFriendListData() {
        
        print("getUserFriendListData starts")
        
        let databaseReference = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        
        print("userid : \(String(describing: userID))")

        if let userID = userID {
            
            readFriendListFromDatabase(inputUserID: userID, inputDatabaseReference: databaseReference) 
            
        } else {
            
            print("userID datasını alamadık")
            return
            
        }
        
    }
    
    func readFriendListFromDatabase(inputUserID : String, inputDatabaseReference : DatabaseReference) {
        
        let userFriendsReference = inputDatabaseReference.child(FirebaseModels.Friends.childFriends).child(inputUserID)
        
        userFriendsReference.observe(DataEventType.value, with: { (dataSnapShot) in
            
            if !dataSnapShot.exists() {
                print("dataSnapshot is empty")
                return
            }
            
            if let snapshot = dataSnapShot.children.allObjects as? [DataSnapshot] {
                
                for snap in snapshot {
                    
                    if let snapDictionary = snap.value as? NSDictionary {
                        
                        let tempUserFriendObject = UserFriend(dataDictionary: snapDictionary as! [String : AnyObject])
                        
                        tempUserFriendObject.userID = snap.key
                        
                        self.sectionBasedFriendsDataObject.userFriendsDictionary.append(tempUserFriendObject)
                        
                    }
                }
            }
            
            //denemeCache2.setObject(self.sectionBasedObject, forKey: CacheConstants.KeyValues.DataPreparedSectionBased as NSString)
            /*
            let temp = denemeCache2.object(forKey: CacheConstants.KeyValues.DataPreparedSectionBased as NSString)
            
            print("temp : \(temp?.tempUserFriendsDictionary.count)")
            print("temp : \(temp?.tempUserFriendsDictionarySorted.count)")
            print("temp : \(temp?.sectionDictionary.count)")
            */
            
        }) { (error) in
            
            if let errorMessage = error as NSError! {
                
                print("errorMessage : \(errorMessage.localizedDescription)")
                print("errorMessage : \(errorMessage.userInfo)")
                
            }
            
        }
        
    }
    
}
