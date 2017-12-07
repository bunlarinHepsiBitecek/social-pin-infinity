//
//  SwiftKeyChainExtensionFunctions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 1.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

extension LoginViewController {
    
    func registerCurrentUserToKeyChain(inputUserID : String, inputUserIDKey : String) {
        
        let _ : Bool = KeychainWrapper.standard.set(inputUserID, forKey: inputUserIDKey)
        
    }
    
    func readKeyChainDataForRememberMeProcess() -> Bool {
        
        print("readKeyChainDataForRememberMeProcess starts")
        
        if let resultRememberMe = KeychainWrapper.standard.bool(forKey: STRING_KEY_REMEMBER_ME) {
            
            return resultRememberMe
            
        } else {
            
            return false
        }
        
    }
    
    func registerdRememberMeUserData(inputEmail : String, inputPassword : String) {
        
        print("registerdRememberMeUserData starts")
        
        if self.checkBoxButton.isChecked == true {
            
            print("yarro 1")
            
            KeychainWrapper.standard.set(inputEmail, forKey: STRING_KEY_EMAIL)
            KeychainWrapper.standard.set(inputPassword, forKey: STRING_KEY_PASSWORD)
            KeychainWrapper.standard.set(true, forKey: STRING_KEY_REMEMBER_ME)
            
        } else {
            
            print("yarro 2")
            
            KeychainWrapper.standard.removeObject(forKey: STRING_KEY_EMAIL)
            KeychainWrapper.standard.removeObject(forKey: STRING_KEY_PASSWORD)
            KeychainWrapper.standard.removeObject(forKey: STRING_KEY_EMAIL)
        }
        
        
        
    }
    
    func setRememberMeEnabledOrDisabled() {
        
        print("setRememberMeEnabledOrDisabled starts")
        
        if readKeyChainDataForRememberMeProcess() {
            
            self.checkBoxButton.isChecked = true
            getUserEmailAndPassword()
            
        } else {
            
            self.checkBoxButton.isChecked = false
        }
        
    }
    
    func getUserEmailAndPassword() {
        
        self.email.text = KeychainWrapper.standard.string(forKey: STRING_KEY_EMAIL)
        self.password.text = KeychainWrapper.standard.string(forKey: STRING_KEY_PASSWORD)
        
    }
    
}
