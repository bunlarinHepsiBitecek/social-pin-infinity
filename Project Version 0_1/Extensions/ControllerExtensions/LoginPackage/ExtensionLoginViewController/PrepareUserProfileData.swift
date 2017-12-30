//
//  CreateUserProfileData.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 28.11.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController {
    
    func prepareUserLoginInfo(userObject : User) -> User {
        
        if let userID = userObject.userID as String? {
            
            userObject.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Users.UserID, inputValue: userID)
            
        }
        
        if let userName = userObject.username as String? {
            
            userObject.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Users.UserName, inputValue: userName)
            
        }
        
        if let nameSurname = userObject.userNameSurname as String? {
            
            userObject.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Users.NameSurname, inputValue: nameSurname)
        }
        
        if let email = userObject.email as String? {
            
            userObject.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Users.Email, inputValue: email)
            
        }
        
        if let gender = userObject.gender as String? {
            
            userObject.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Users.Gender, inputValue: gender)
            
        }
        
        if let birthday = userObject.birthday as String? {
            
            userObject.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Users.Birthday, inputValue: birthday)
            
        }
        
        return userObject
        
    }
    
}
