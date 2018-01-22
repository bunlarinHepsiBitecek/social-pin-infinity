//
//  UserFriends.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 20.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class UserFriends {

    private var _userFriendList : [UserFriend]

    init() {
        
        _userFriendList = []
    }
    
    var userFriendList : [UserFriend] {
        get {
            
            return _userFriendList
            
        }
        set {
            _userFriendList = newValue
        }
    }
    
}


