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
    
    func readUserInfo() {
        
        print("readUserInfo starts")
        
        let databaseReference = Database.database().reference().child(FirebaseStorageConstants.Users)
        
        if let user = Auth.auth().currentUser {
            
            print("check1")
            
            let childUserReference = databaseReference.child(user.uid)
            
            print("childUserReference : \(childUserReference)")
            
            childUserReference.observeSingleEvent(of: DataEventType.value, with: { (dataSnapShot) in
                
                if !dataSnapShot.exists() {
                    
                    print("check2")
                    return
                    
                } else {
                    
                    print("check3")
                    
                    let userInfo = dataSnapShot.value as! NSDictionary
                    
                    print("userinfo : \(userInfo)")
                    
                    let profileUrl = userInfo["profilePictureUrl"] as! String
                    
                    print("profileUrl : \(profileUrl)")
                    
                    self.user.setUserProfilePictureUrl(inputUrl: profileUrl)
                    
                    if !profileUrl.isEmpty {
                        
                        print("erku3")
                        
                        let url = URL(string: profileUrl)
                        
                        let request = URLRequest(url: url!)
                        
                        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, urlResponse, error) in
                            
                            if error != nil {
                                
                                if let errorMessage = error as NSError? {
                                    
                                    print("errorMessage : \(errorMessage.localizedDescription)")
                                    
                                }
                                
                            } else {
                                
                                print("erku4")
                                
                                if let image = UIImage(data: data!) {
                                    
                                    print("erku5")
                                    
                                    DispatchQueue.main.async(execute: {
                                        
                                        print("erku6")
                                        
                                        cachedProfilePicture.setObject(image, forKey: profileUrl as NSString)
                                        
                                        
                                    })
                                }
                            }
                        })
                        
                        task.resume()
                    }
                    
                }
                
            })
            
        }
        
    }
    
    func setUserProfilePictureToObject() {
        
        let tempImageView = UIImageView()
        
        tempImageView.getProfileImage(user.userProfilePictureUrl)
        
        if let image = tempImageView.image {
            
            user.setUserProfilePicture(inputUserProfileImage: image)
            user.isUserProfilePictureGet = true
            
        }
        
    }
    
}
