//
//  UserFriend.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 20.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class UserFriend {
    
    private var _userID : String
    private var _userImage : UIImage
    private var _userFriendChildData : UserFriendChildData
    
    init() {
        
        _userID = SPACE_CHARACTER
        _userImage = UIImage()
        _userFriendChildData = UserFriendChildData()

    }
    
    init(dataDictionary: [String : AnyObject]) {
        
        _userID = SPACE_CHARACTER
        _userImage = UIImage()
        _userFriendChildData = UserFriendChildData(dataDictionary: dataDictionary)
        
    }

    var userID: String {
        get {
            return _userID
        }
        set {
            _userID = newValue
        }
    }
    
    var userImage: UIImage {
        get {
            return _userImage
        }
        set {
            _userImage = newValue
        }
    }
    
    var userFriendChildData : UserFriendChildData {
        
        get {
            return _userFriendChildData
        }
        set {
            _userFriendChildData = newValue
        }
        
    }
    
}

