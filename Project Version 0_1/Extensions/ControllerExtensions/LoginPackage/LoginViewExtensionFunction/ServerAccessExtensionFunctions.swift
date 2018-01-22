//
//  ServerAccessExtensionFunctions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 1.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import SwiftKeychainWrapper

let denemeCache = NSCache<NSString, UserFriends>()

var tempUserFriendsDictionary = [UserFriend]()

extension LoginViewController {
    
    /*
        if user is not register, function below creates a new user in firebase Users database
    */
    func createUserWithCredentials() {
        
        Auth.auth().createUser(withEmail: self.userDatabaseObjectToPass.email, password: self.userDatabaseObjectToPass.password) { (user, error) in
            
            if error != nil {
                print("createUserWithCredentials : Unable to authenticate with Firebase using email")
                
                if let errorMessage = error as NSError? {
                    
                    print("createUserWithCredentials : errorMessage : \(errorMessage.userInfo)")
                    print("createUserWithCredentials : errorMessage : \(errorMessage)")
                    
                }
                
                if let errorCode = Firebase.AuthErrorCode(rawValue: (error?._code)!) {
                    
                    print("createUserWithCredentials : ErrorCode : \(errorCode.rawValue)")
                    
                }
                
                self.stopSpinner()
                
            } else {
                
                print("createUserWithCredentials : User successfully created in firebase")
                // ... save userID to keyChainWrapper
                
                if let userObject = user {
                    
                    if let userID = userObject.uid as String? {
                        
                        print("createUserWithCredentials : userID : \(userID)")
                        
                        self.registerCurrentUserToKeyChain(inputUserID: userID, inputUserIDKey: USER_ID)
                        
                        self.userDatabaseObjectToPass.setUserID(inputUserID: userID)
                        self.userDatabaseObjectToPass.setUserName(inputName: "baserkut")
                        self.userDatabaseObjectToPass.setUserNameSurname(inputNameSurname: "Erkut Bas")
                        self.userDatabaseObjectToPass.setUserGender(inputUserGender: "Erkek")
                        self.userDatabaseObjectToPass.setUserBirthday(inputUserBirthday: "18.03.1988")
                        
                        self.userDatabaseObjectToPass = self.prepareUserLoginInfo(userObject: self.userDatabaseObjectToPass)
                        
                    }
                    
                }
                
                print("createUserWithCredentials : keyChainData : \(String(describing: KeychainWrapper.standard.data(forKey: USER_ID)))")
                print("createUserWithCredentials : keyChainData : \(String(describing: KeychainWrapper.standard.string(forKey: USER_ID)))")
                
                self.stopSpinner()
                
            }
        }
    }
    
    /*
        if user is registered firebase database, function below is used to login User to the system
     */
    func loginUserWithCredentials() {
        
        startSpinner()
        
        Auth.auth().signIn(withEmail: userDatabaseObjectToPass.email, password: userDatabaseObjectToPass.password) { (user, error) in
            
            /*
             error handling onto firebase ???
             */
            if error != nil {
                
                if let errorMessage = error as NSError? {
                    
                    print("LoginButtonClick : \(errorMessage)")
                    print("LoginButtonClick : \(errorMessage.userInfo)")
                    print("LoginButtonClick : \(errorMessage.localizedDescription)")
                    
                }
                
                if let errorCode = Firebase.AuthErrorCode(rawValue: (error?._code)!) {
                    
                    print("----->>>>> : \(alertType.Error)")
                    
                    self.PopUpFromSCLAlertViews(inputAlertType: alertType.Error, inputAlertField: .EmptyType, inputFirebaseErrorCode: errorCode)
                    
                    self.stopSpinner()
                    
                }
                
                /*
                 user is already created and logged in process is successfull
                 */
            } else {
                
                self.setProfileImage()
                self.getUserFriendListData()
                self.stopSpinner()
                
                print("loginButtonClick : user is logged in successfully")
                print("loginButtonClick : user.isEmailVerified : \(user?.isEmailVerified)")
                // let's check user object is not null
                if let user = user {
                    
                    self.userDatabaseObjectToPass.setUserID(inputUserID: user.uid)
                    
                    if user.isEmailVerified == false {
                        
                        self.gotoVerificationView(inputUserIsEmailVerifiedFlag: user.isEmailVerified)
                        
                    } else {
                        
                        self.gotoMainPage()
                        
                    }
                }
            }
        }
    }
    
    func startSpinner() {
        
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        
        activityIndicator.color = UIColor.purple
        
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        
        view.setViewBackgroundColourShadow()
        
    }
    
    func stopSpinner() {
        
        activityIndicator.stopAnimating()
        view.resetViewBackgroundColor()
    }
    
    func setProfileImage() {
        
        let ref = Database.database().reference()
        let uid = Auth.auth().currentUser?.uid
        let userRef = ref.child("Users").child(uid!)
        
        userRef.observeSingleEvent(of: .value) { (dataSnapShot) in
            
            if !dataSnapShot.exists() {
                
                print("cıkıyoruz")
                return
                
            }
            
            
            let userInfo = dataSnapShot.value as! NSDictionary
            
            print("userinfo : \(userInfo)")
            
            let profileUrl = userInfo["profilePictureUrl"] as! String
            
            print("profileUrl : \(profileUrl)")
            
            let storageRef = Storage.storage().reference(forURL: profileUrl)
            
            storageRef.downloadURL(completion: { (url, error) in
                
                if error != nil {
                    
                    if let errorMessage = error as NSError? {
                        
                        print("errorMesssage : \(errorMessage.userInfo)")
                        print("errorMesssage : \(errorMessage.localizedDescription)")
                        
                    }
                    
                } else {
                    
                    print("x")
                    
                    do {
                        
                        let data = try Data(contentsOf: url!)
                        let image = UIImage(data: data as Data)
                        self.userDatabaseObjectToPass.setUserProfilePicture(inputUserProfileImage: image!)
                        
                    } catch {
                        
                        print("boku yedik")
                        
                    }
                }
            })
        }
    }
    
    func getUserFriendList() {
     
        print("getUserFriendList starts")
        
        let ref = Database.database().reference()
        let uid = Auth.auth().currentUser?.uid
        print("userID : \(uid)")
        
        let yarroRef = ref.child("Friends").child(uid!)
        
        print("yarroRef :\(yarroRef)")
        
        yarroRef.observe(DataEventType.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                
                let userX = UserForPrototypeCell(dictionary: dictionary)
                userList.append(userX)
                
                //this will crash because of background thread, so lets use dispatch_async to fix
                
            }
            
        }) { (error) in
            
            if let errorMessage = error as NSError? {
                
                print("?????????errorMessage : \(errorMessage)")
                print("?????????errorMessage : \(errorMessage.userInfo)")
                print("?????????errorMessage : \(errorMessage.localizedDescription)")
                
            }
            
        }
        
        yarroRef.observe(DataEventType.value, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                
                let userX = UserForPrototypeCell(dictionary: dictionary)
                userList.append(userX)
                
                //this will crash because of background thread, so lets use dispatch_async to fix
                /*
                 DispatchQueue.main.async(execute: {
                 self.tableView.reloadData()
                 })*/
                
            }
            
        }) { (error) in
            
            if let errorMessage = error as NSError? {
                
                print("?????????errorMessage : \(errorMessage)")
                print("?????????errorMessage : \(errorMessage.userInfo)")
                print("?????????errorMessage : \(errorMessage.localizedDescription)")
                
            }
            
        }
        
        for item in userList {
            
            print("---> :\(item.userName)")
            print("---> :\(item.userImageUrl)")
            
        }
        
        
    }
    
    func getUserFriendList2() {
        let ref = Database.database().reference()
        let uid = Auth.auth().currentUser?.uid
        print("userID : \(uid)")
        
        let yarroRef = String(describing: ref.child("Friends").child(uid!))
        let yarroRefUrl = URL(string: yarroRef)
        
        yarroRefUrl?.baseURL
        
        print("----a :\(yarroRefUrl?.baseURL)")
        print("----b :\(yarroRefUrl?.absoluteURL)")
        print("----c :\(yarroRefUrl?.isFileURL)")
        
        print("yarroRef :\(yarroRef)")
        print("yarroRefUrl :\(yarroRefUrl)")
        
        let request = NSURLRequest(url: (yarroRefUrl?.absoluteURL)!, cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 30.0)
        
        let request2 = URLRequest(url: yarroRefUrl!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 30.0)
        
        print("request : \(request)")
        print("request2 :\(request2)")
        
        //let task = URLSession.shared.dataTask(with: request2)
        
        /*
        let task2 = URLSession.shared.dataTask(with: request2) { (data, urlResponse, error) in
            
            print("data : \(data)")
            print("urlResponse :\(urlResponse)")
            print("error :\(error)")
            
            let responseObject = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
            
            print("responseObject :\(String(describing: responseObject))")
            
           
        }
        
        task2.resume()
        
        print("task2 :\(task2)")*/
        
    }
    
    
    
    func getUserFriendListData() {
        
        print("getUserFriendListData starts")
        
        let ref = Database.database().reference()
        let uid = Auth.auth().currentUser?.uid
        let userFriendsReference = ref.child(FirebaseModels.Friends.childFriends).child(uid!)
        
        userFriendsReference.observe(DataEventType.value, with: { (dataSnapShot) in
            
            if !dataSnapShot.exists() {
                return
            }
            
            if let snapshot = dataSnapShot.children.allObjects as? [DataSnapshot] {
            
                print("snapShot : \(snapshot)")
            
                for snap in snapshot {
                    
                    print("snap : \(snap)")
                    print("snapx : \(snap.key)")
                    print("snapy : \(snap.value)")
                    
                    if let snapDictionary = snap.value as? NSDictionary {
                        
                        print("snapDictionary : \(snapDictionary)")
                        
                        let tempUserFriendObject = UserFriend(dataDictionary: snapDictionary as! [String : AnyObject])
                        tempUserFriendObject.userID = snap.key
                        
                        print("boko : \(tempUserFriendObject.userFriendChildData.userImageUrl)")
                        
                        if !tempUserFriendObject.userFriendChildData.userImageUrl.isEmpty {
                            
                            let storageRef = Storage.storage().reference(forURL: tempUserFriendObject.userFriendChildData.userImageUrl)
                            
                            print("storageRef : \(storageRef)")
                            
                            storageRef.downloadURL(completion: { (url, error) in
                                
                                if error != nil {
                                    
                                    if let errorMessage = error as NSError? {
                                        
                                        print("errorMessage : \(errorMessage.localizedDescription)")
                                        print("errorMessage : \(errorMessage.userInfo)")
                                        
                                    }
                                    
                                } else {
                                    
                                    do {
                                        
                                        let data = try Data(contentsOf: url!)
                                        let image = UIImage(data: data as Data)
                                        
                                        tempUserFriendObject.userImage = image!
                                        
                                        
                                        
                                    } catch {
                                        
                                        print("boku yedik")
                                        
                                    }
                                    
                                }
                                
                            })
                            
                            
                        }
                        
                        tempUserFriendsDictionary.append(tempUserFriendObject)
                        
                        
                        
                    }
                    
                }
                
                let something = UserFriends()
                something.userFriendList = tempUserFriendsDictionary
                
                
                
                DispatchQueue.main.async(execute: {
                    
                    denemeCache.setObject(something, forKey: "data" as NSString)
                    
                })
                
            }
            
        }) { (error) in
            
            if let errorMessage = error as NSError! {
                
                print("errorMessage : \(errorMessage.localizedDescription)")
                print("errorMessage : \(errorMessage.userInfo)")
                
            }
            
        }
        
        print("zalalalaal : \(tempUserFriendsDictionary.count)")
        
        
        
    }
    
    
}
