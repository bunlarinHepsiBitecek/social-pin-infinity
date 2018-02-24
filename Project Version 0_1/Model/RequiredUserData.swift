//
//  NecessaryUserData.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 2/22/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit
import Firebase

class RequeiredUserData {
    
    private static var currentUserID : RequeiredUserData = {
        
        let userID = RequeiredUserData(inputCurrentUserID: (Auth.auth().currentUser?.uid)!)
        
        print("requiredUserData starts")
        print("userID : \(userID) ")
        
        return userID
    }()
    
    let _currentUserID : String
    
    private init(inputCurrentUserID : String) {
        
        self._currentUserID = inputCurrentUserID
    }
    
    // MARK: - Accessors
    
    class func getCurrentUserID() -> RequeiredUserData {
        
        return currentUserID
        
    }
    
}
