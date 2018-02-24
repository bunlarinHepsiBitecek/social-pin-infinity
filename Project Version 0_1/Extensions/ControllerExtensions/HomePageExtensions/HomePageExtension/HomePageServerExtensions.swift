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
    
    func getUserGroupData(inputGroupID : String) {
        
        print("getUserGroupData starts")
        print("databaseReferenceObject : \(databaseReferenceObject)")
        print("inputGroupID : \(inputGroupID)")
        
        let currentUserID = RequeiredUserData.getCurrentUserID()._currentUserID
        
        print("currentUseID : \(currentUserID)")
        
        let groupDataReference = databaseReferenceObject.child(FirebaseModels.Groups.childGroups).child(inputGroupID)
        
        print("groupDataReference : \(groupDataReference)")
        
        groupDataReference.observe(.value) { (dataSnapShot) in
            
            if !dataSnapShot.exists() {
                
                print("groupDataNotExists")
                
                userGroupDataFromFirebase.isGroupDataExists = false
                
            }
            
            print("datasnapshot : \(dataSnapShot)")
            
            if let snapDictionary = dataSnapShot.value as? NSDictionary {
                
                print("snapDictionary : \(snapDictionary)")
                
                let tempGroupData = Group(dataDictionary: snapDictionary as! [String : Any])
                
                userGroupDataFromFirebase = tempGroupData
                
                print("userGroupDataFromFirebase : \(userGroupDataFromFirebase.groupName)")
                print("userGroupDataFromFirebase : \(userGroupDataFromFirebase.adminUserID)")
                
                for item in userGroupDataFromFirebase.groupMembers {
                    
                    print("--> : \(item.userFriendChildData.userName)")
                    print("--> : \(item.userFriendChildData.userImageUrl)")
                    print("--> : \(item.userID)")
                    
                }
                
            }
            
        }
        
    }
    
    func getUserGroupList(completion : @escaping (_ result: Bool) -> Void) {
        
        print("getUserGroupList starts")
        
        print("databaseReferenceObject : \(databaseReferenceObject)")
        
        let userGroupListReference = databaseReferenceObject.child(FirebaseModels.UserGroups.childUserGroups).child(RequeiredUserData.getCurrentUserID()._currentUserID)
        
        print("userGroupListReference : \(userGroupListReference)")
        
        userGroupListReference.observe(.value) { (datasnapshot) in
            
//            print("datasnapshot : \(datasnapshot)")
            
            if !datasnapshot.exists() {
                
                return
                
            }
            
            constantUserGroupDetailedList.userID = datasnapshot.key
            
            if let datasnapshotValueDictionary = datasnapshot.value as? NSDictionary {
                
                var counter = 0
                
                for item in datasnapshotValueDictionary {
                    
                    counter += 1
                    
                    if let itemString = item.key as? String {
                        
                        let tempGroupObject = Group()
                        
                        tempGroupObject.groupID = itemString
                        constantUserGroupDetailedList.groupList.append(tempGroupObject)
                        
                        print("item : \(counter), tempGroupObject.groupID : \(tempGroupObject.groupID)")
                        
                    }
                }
                
            }
            
            completion(true)
        }
        
        
    }
    
    
    func startGettingGroupDataProcess() {
        
        print("startGettingGroupDataProcess startss")
        
        getUserGroupList { (result) in
            
            if result {
                
                print("listeyi almayı bitirdik sonra yazdırdık")
                print("let's get group detailed data")
                
                print("total group list count : \(constantUserGroupDetailedList.groupList.count)")
                
                for item in constantUserGroupDetailedList.groupList {
                    
                    print("item.groupID : \(item.groupID)")
                    
                    self.getUserGroupData(inputGroupID: item.groupID)
                    
                }
            }
            
        }
        
        
        
    }
    
}



























