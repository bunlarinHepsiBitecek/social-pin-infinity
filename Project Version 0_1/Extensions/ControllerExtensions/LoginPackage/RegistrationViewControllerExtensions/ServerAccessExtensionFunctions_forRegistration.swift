//
//  ServerAccessExtensionFunctions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 9.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import SwiftKeychainWrapper

extension RegisterViewController {
    
    /*
     if user is not register, function below creates a new user in firebase Users database
     */
    func createUserWithCredentials() -> Bool {
        
        var isFirebaseUserCreated = false
        
        startSpinner()
        
        Auth.auth().createUser(withEmail: self.user.email, password: self.user.password) { (user, error) in
            if error != nil {
                print("createUserWithCredentials : Unable to authenticate with Firebase using email")
                
                if let errorCode = Firebase.AuthErrorCode(rawValue: (error?._code)!) {
                    
                    print("createUserWithCredentials : ErrorCode : \(errorCode.rawValue)")
                    
                    let alertView : InformationAlertView = InformationAlertView()
                    
                    switch errorCode {
                    case .invalidEmail:
                        print("invalid email")
                        alertView.showError(subTitle: CONSTANT_WARNING_INVALID_EMAIL_FORMAT)
                    case .emailAlreadyInUse:
                        print("in use")
                        alertView.showError(subTitle: CONSTANT_WARNING_EMAIL_ALREADY_IN_USE)
                    case .wrongPassword:
                        print("wrong password")
                        alertView.showError(subTitle: CONSTANT_WARNING_INVALID_PASSWORD_FORMAT)
                    default:
                        print("Create User Error: \(error!)")
                        alertView.showError(subTitle: CONSTANT_WARNING_PLEASE_TRY_AGAIN_LATER)
                    }
                    
                }
                
                self.stopSpinner()
                
            } else {
                
                print("createUserWithCredentials : User successfully created in firebase")
                // ... save userID to keyChainWrapper
                
                if let userObject = user {
                    
                    if let userID = userObject.uid as String? {
                        
                        print("createUserWithCredentials : userID : \(userID)")
                        
                        self.registerCurrentUserToKeyChain(inputUserID: userID, inputUserIDKey: USER_ID)
                        self.user.setUserID(inputUserID: userID)
                        isFirebaseUserCreated = true
                        
                    }
                    
                }
                
                print("createUserWithCredentials : keyChainData : \(String(describing: KeychainWrapper.standard.data(forKey: USER_ID)))")
                print("createUserWithCredentials : keyChainData : \(String(describing: KeychainWrapper.standard.string(forKey: USER_ID)))")
                
                self.stopSpinner()
                self.directToAddImageView()
                
            }
        
        } // end of Auth.auth().createUser
        
        print("isFirebaseUserCreated : \(isFirebaseUserCreated)")
        
        return isFirebaseUserCreated
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
    
    func directToAddImageView() {
        
        let addImageVCObject = storyboard?.instantiateViewController(withIdentifier: "AddImageViewController_storyBorad_ID") as! AddImageViewController
        
        addImageVCObject.userObject = self.user
        
        navigationController?.pushViewController(addImageVCObject, animated: true)
        
    }
    
}

