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
                
                Firebase.AuthErrorCode(rawValue: (error?._code)!)
                
                if let errorCode = Firebase.AuthErrorCode(rawValue: (error?._code)!) {
                    
                    switch errorCode {
                        
                    case .userNotFound:
                        print("user is not found, let's create one")
                        self.createUserWithCredentials()
                        
                    default:
                        print("nothing to do at this point")
                    }
                }
                
                /*
                 user is already created and logged in process is successfull
                 */
            } else {
                
                self.stopSpinner()
                
                print("loginButtonClick : user is logged in successfully")
                print("loginButtonClick : user.isEmailVerified : \(user?.isEmailVerified)")
                // let's check user object is not null
                if let user = user {
                    
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
    
}
