//
//  UserFriendChildData.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 20.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class UserFriendChildData {
    
    private var _userName : String
    private var _userImageUrl : String
    
    init() {
        
        _userName = SPACE_CHARACTER
        _userImageUrl = SPACE_CHARACTER
        
    }
    
    init(dataDictionary : [String : Any]) {
        
        self._userName = dataDictionary["nameSurname"] as? String ?? ""
        self._userImageUrl = dataDictionary["profilePictureUrl"] as? String ?? ""
    }
    
    var userName: String {
        get {
            return _userName
        }
        set {
            _userName = newValue
        }
    }
    
    var userImageUrl: String {
        get {
            return _userImageUrl
        }
        set {
            _userImageUrl = newValue
        }
    }
    
}
