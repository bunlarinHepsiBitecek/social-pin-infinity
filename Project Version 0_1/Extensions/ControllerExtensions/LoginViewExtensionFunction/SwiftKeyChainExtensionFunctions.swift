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
        
        if let resultRememberMe = KeychainWrapper.standard.bool(forKey: STRING_KEY_REMEMBER_ME) {
            
            return resultRememberMe
            
        } else {
            
            return false
        }
        
    }
    
    func registerdRememberMeUserData(inputEmail : String, inputPassword : String) {
        
        if self.checkBoxButton.isChecked == true {
            
            KeychainWrapper.standard.set(inputEmail, forKey: STRING_KEY_EMAIL)
            KeychainWrapper.standard.set(inputPassword, forKey: STRING_KEY_PASSWORD)
            
        } else {
            
            KeychainWrapper.standard.removeObject(forKey: STRING_KEY_EMAIL)
            KeychainWrapper.standard.removeObject(forKey: STRING_KEY_PASSWORD)
        }
        
        
        
    }
    
    
    func setRememberMeEnabledOrDisabled() {
        
        if readKeyChainDataForRememberMeProcess() {
            
            self.checkBoxButton.isChecked = true
            
        } else {
            
            self.checkBoxButton.isChecked = false
        }
        
    }
    
}
