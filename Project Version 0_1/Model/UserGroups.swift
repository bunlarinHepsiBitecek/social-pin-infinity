//
//  File.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 2/22/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

var constantUserGroupDetailedList = UserGroups()

class UserGroups {
    
    private var _userID : String
    private var _groupList : [Group]

    init() {
        
        _userID = SPACE_CHARACTER
        _groupList = []
        
    }
    
    var userID : String {
        get {
            return _userID
        }
        set {
            _userID = newValue
        }
    }
    
    var groupList: [Group] {
        get {
            return _groupList
        }
        set {
            _groupList = newValue
        }
    }
    
}
