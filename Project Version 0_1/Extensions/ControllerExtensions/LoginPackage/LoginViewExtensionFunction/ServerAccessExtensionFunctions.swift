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

let denemeCache2 = NSCache<NSString, SectionBasedFriendsData>()

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
                
                //self.setProfileImage()
                self.getProfileImage()
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
    
    func getProfileImage() {
        
        let databaseReference = Database.database().reference()
        
        if let user = Auth.auth().currentUser {
            
            let childUserReference = databaseReference.child(user.uid)
            
            childUserReference.observeSingleEvent(of: DataEventType.value, with: { (dataSnapShot) in
                
                if !dataSnapShot.exists() {
                    
                    return
                    
                } else {
                    
                    let userInfo = dataSnapShot.value as! NSDictionary
                    
                    print("userinfo : \(userInfo)")
                    
                    let profileUrl = userInfo["profilePictureUrl"] as! String
                    
                    print("profileUrl : \(profileUrl)")
                    
                    if !profileUrl.isEmpty {
                        
                        let url = URL(string: profileUrl)
                        
                        if let urlUnwrapped = url {
                            
                            let request = URLRequest(url: urlUnwrapped)
                            
                            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, urlResponse, error) in
                                
                                if error != nil {
                                    
                                    if let errorMessage = error as NSError? {
                                        
                                        print("errorMessage : \(errorMessage.localizedDescription)")
                                        
                                    }
                                    
                                } else {
                                    
                                    if let image = UIImage(data: data!) {
                                        
                                        self.userDatabaseObjectToPass.setUserProfilePicture(inputUserProfileImage: image)
                                        
                                    }
                                }
                                
                            })
                            
                            task.resume()
                            
                        }
                        
                        
                    }
                    
                }
                
            })
            
        }
        
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
        
}
