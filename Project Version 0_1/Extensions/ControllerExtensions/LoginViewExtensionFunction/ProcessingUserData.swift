//
//  ProcessingUserData.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 1.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController {
    
    func setUserData() {
        
        self.userDatabaseObjectToPass.setEmailAndPassword(inputUserEmail: self.email.text!, inputUserPassword: self.password.text!)
        
    }
    
    func setUserEmailData() {
        
        self.userDatabaseObjectToPass.setUserEmail(inputEmail: self.email.text!)
        
    }
    
    func clearTextFieldsOnLoginView() {
        
        print("clearTextFieldsOnLoginView starts")
        
        let action = #selector(clearProcessFunction)
        
        NotificationCenter.default.addObserver(self, selector: action, name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
        
    }
    
    @objc private func clearProcessFunction() {
        
        print("clearProcessFunction starts")
        
        self.email.text = self.userDatabaseObjectToPass.email
        self.password.text = SPACE_CHARACTER
        
        self.clearAllKeychainData()
        
    }
}
