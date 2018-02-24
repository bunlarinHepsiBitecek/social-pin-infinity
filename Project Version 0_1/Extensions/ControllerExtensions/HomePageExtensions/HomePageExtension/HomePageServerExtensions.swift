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
    
    /*
        getting group data from firebase
     
     */
    func getUserAllGroupList(completion : @escaping (_ result: Bool) -> Void) {
        
        print("getUserAllGroupList starts")
        print("databaseReferenceObject : \(databaseReferenceObject)")
        
        let userGroupListReference = databaseReferenceObject.child(FirebaseModels.UserGroups.childUserGroups).child(RequeiredUserData.getCurrentUserID()._currentUserID)
        
        print("userGroupListReference : \(userGroupListReference)")
        
        userGroupListReference.observe(.value) { (datasnapshot) in
            
            if !datasnapshot.exists() {
                
                return
                
            }
            
            constantUserGroupDataObject.user.setUserID(inputUserID: datasnapshot.key)
            
            if let datasnapshotValueDictionary = datasnapshot.value as? NSDictionary {
                
                var counter = 0
                
                for item in datasnapshotValueDictionary {
                    
                    counter += 1
                    
                    let tempGroupObject = Group()
                    
                    if let itemValue = item.value as? Int {
                        
                        tempGroupObject.isGroupActive = Bool(truncating: itemValue as NSNumber)
                        
                    }
                    
                    if let itemString = item.key as? String {
                        
                        tempGroupObject.groupID = itemString
                        
                    }
                    
                    constantUserGroupDataObject.userGroupList.append(tempGroupObject)
                    
                    print("item : \(counter), tempGroupObject.groupID : \(tempGroupObject.groupID)")
                    print("item : \(counter), tempGroupObject.isGroupActive : \(tempGroupObject.isGroupActive)")
                    
                }
                
            }
            
            completion(true)
        }
    }
    
    func getUserGroupData(inputGroupData : Group) {
        
        print("getUserGroupData starts")
        print("databaseReferenceObject : \(databaseReferenceObject)")
        print("groupID : \(inputGroupData.groupID)")
        
        let currentUserID = RequeiredUserData.getCurrentUserID()._currentUserID
        
        print("currentUseID : \(currentUserID)")
        
        let groupDataReference = databaseReferenceObject.child(FirebaseModels.Groups.childGroups).child(inputGroupData.groupID)
        
        print("groupDataReference : \(groupDataReference)")
        
        groupDataReference.observe(.value) { (dataSnapShot) in
            
            if !dataSnapShot.exists() {
                
                print("groupDataNotExists")
                    
            }
            
            print("datasnapshot : \(dataSnapShot)")
            
            if let snapDictionary = dataSnapShot.value as? NSDictionary {
                
                print("snapDictionary : \(snapDictionary)")
                constantUserGroupDataObject.userGroupSortedDictionary[inputGroupData.groupID]?.setParsedDataToCurrenctObject(dataDictionary: snapDictionary as! [String : Any])
                
                print("baslıyor..........")
                
                print("-> \(constantUserGroupDataObject.userGroupSortedDictionary[inputGroupData.groupID]?.groupID)")
                print("-> \(constantUserGroupDataObject.userGroupSortedDictionary[inputGroupData.groupID]?.groupName)")
                print("-> \(constantUserGroupDataObject.userGroupSortedDictionary[inputGroupData.groupID]?.groupMembers.count)")
                
                for item in (constantUserGroupDataObject.userGroupSortedDictionary[inputGroupData.groupID]?.groupMembers)! {
                    
                    print("starts")
                    
                    print("---> : \(item.userFriendChildData.userName)")
                    print("---> : \(item.userFriendChildData.userImageUrl)")
                    
                    print("ends")
                
                }
                
                
                print("bitiyor..........")
                
            }
        }
    }

    func startGettingGroupDataProcess() {
        
        print("startGettingGroupDataProcess startss")
        
        getUserAllGroupList { (result) in
            
            if result {
                
                print("listeyi almayı bitirdik sonra yazdırdık")
                print("let's get group detailed data")
                
                print("total group list count : \(constantUserGroupDataObject.userGroupList.count)")
                
                var x = 0
                
                constantUserGroupDataObject.sortUserGroupList()
                constantUserGroupDataObject.loadSortedDictionary()
                
                for item in constantUserGroupDataObject.userGroupSortedList {
                    
                    if (constantUserGroupDataObject.userGroupSortedDictionary[item.groupID]?.isGroupActive)! {
                        
                        print("item.groupID : \(item.groupID)")
                        print("item.isGroupActive : \(item.isGroupActive)")
                        
                        if item.isGroupActive {
                            
                            x += 1
                            print("x : \(x)")
                            self.getUserGroupData(inputGroupData: item)
                            
                        }
                    }
                }
            }
        }
    }
}



























