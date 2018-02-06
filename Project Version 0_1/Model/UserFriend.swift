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
    private var _userImageLoaded : Bool
    private var _userFriendChildData : UserFriendChildData
    private var _isUserSelected : Bool
    
    private var _userCellSecionInfo : Int
    private var _userCellRowInfo : Int
    
    init() {
        
        _userID = SPACE_CHARACTER
        _userImage = UIImage()
        _userImageLoaded = false
        _userFriendChildData = UserFriendChildData()
        _isUserSelected = false
        _userCellSecionInfo = 0
        _userCellRowInfo = 0

    }
    
    init(dataDictionary: [String : AnyObject]) {
        
        _userID = SPACE_CHARACTER
        _userImage = UIImage()
        _userImageLoaded = false
        _userFriendChildData = UserFriendChildData(dataDictionary: dataDictionary)
        _isUserSelected = false
        _userCellSecionInfo = 0
        _userCellRowInfo = 0
        
    }
    
    var userID: String {
        get {
            return _userID
        }
        set {
            _userID = newValue
        }
    }
    
    var userImageLoaded: Bool {
        get {
            return _userImageLoaded
        }
        set {
            _userImageLoaded = newValue
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
    
    var isUserSelected : Bool {
        get {
            return _isUserSelected
        }
        set {
            _isUserSelected = newValue
        }
    }
    
    var userCellSecionInfo : Int {
        get {
            return _userCellSecionInfo
        }
        set {
            _userCellSecionInfo = newValue
        }
    }
    
    var userCellRowInfo : Int {
        get {
            return _userCellRowInfo
        }
        set {
            _userCellRowInfo = newValue
        }
    }
    
}

