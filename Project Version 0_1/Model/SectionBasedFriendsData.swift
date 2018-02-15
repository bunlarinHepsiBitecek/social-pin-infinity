//
//  SectionBasedFriendsData.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 24.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit
import Firebase

let cacheDataForFriendList = NSCache<NSString, SectionBasedFriendsData>()

let cachedFriendProfileImages = NSCache<NSString, UIImage>()

var selectedFriendArray = [UserFriend]()

class SectionBasedFriendsData {
    
    private var _userFriendsDictionary : [UserFriend]
    private var _userFriendsDictionarySorted : [UserFriend]
    private var _userSearchResultFriendList : [UserFriend]
    private var _userSelectedFriendsCollectionViewData : [UserFriend]
    private var _sectionDictionary = NSDictionary() as! [String : [UserFriend]]
    private var _selectedFriendForDatabaseOperations = NSDictionary() as! [String : UserFriend]
    private var _keyData : Array<String>
    
    private var _friendListInitial_A : [UserFriend]
    private var _friendListInitial_B : [UserFriend]
    private var _friendListInitial_C : [UserFriend]
    private var _friendListInitial_D : [UserFriend]
    private var _friendListInitial_E : [UserFriend]
    private var _friendListInitial_F : [UserFriend]
    private var _friendListInitial_G : [UserFriend]
    private var _friendListInitial_H : [UserFriend]
    private var _friendListInitial_I : [UserFriend]
    private var _friendListInitial_J : [UserFriend]
    private var _friendListInitial_K : [UserFriend]
    private var _friendListInitial_L : [UserFriend]
    private var _friendListInitial_M : [UserFriend]
    private var _friendListInitial_N : [UserFriend]
    private var _friendListInitial_O : [UserFriend]
    private var _friendListInitial_P : [UserFriend]
    private var _friendListInitial_Q : [UserFriend]
    private var _friendListInitial_R : [UserFriend]
    private var _friendListInitial_S : [UserFriend]
    private var _friendListInitial_T : [UserFriend]
    private var _friendListInitial_U : [UserFriend]
    private var _friendListInitial_V : [UserFriend]
    private var _friendListInitial_W : [UserFriend]
    private var _friendListInitial_X : [UserFriend]
    private var _friendListInitial_Y : [UserFriend]
    private var _friendListInitial_Z : [UserFriend]
    
    init() {
        
        _userFriendsDictionary = []
        _userFriendsDictionarySorted = []
        _userSearchResultFriendList = []
        _userSelectedFriendsCollectionViewData = []
        _sectionDictionary = NSDictionary() as! [String : [UserFriend]]
        _selectedFriendForDatabaseOperations = NSDictionary() as! [String : UserFriend]
        _keyData = Array()
        
        _friendListInitial_A = []
        _friendListInitial_B = []
        _friendListInitial_C = []
        _friendListInitial_D = []
        _friendListInitial_E = []
        _friendListInitial_F = []
        _friendListInitial_G = []
        _friendListInitial_H = []
        _friendListInitial_I = []
        _friendListInitial_J = []
        _friendListInitial_K = []
        _friendListInitial_L = []
        _friendListInitial_M = []
        _friendListInitial_N = []
        _friendListInitial_O = []
        _friendListInitial_P = []
        _friendListInitial_Q = []
        _friendListInitial_R = []
        _friendListInitial_S = []
        _friendListInitial_T = []
        _friendListInitial_U = []
        _friendListInitial_V = []
        _friendListInitial_W = []
        _friendListInitial_X = []
        _friendListInitial_Y = []
        _friendListInitial_Z = []
        
    }
    
    var userFriendsDictionary : [UserFriend] {
        
        get {
            return _userFriendsDictionary
        }
        set {
            _userFriendsDictionary = newValue
        }
    }
    
    var userFriendsDictionarySorted : [UserFriend] {
        
        get {
            return _userFriendsDictionarySorted
        }
        set {
            _userFriendsDictionarySorted = newValue
        }
    }
    
    var userSearchResultFriendList : [UserFriend] {
        
        get {
            return _userSearchResultFriendList
        }
        set {
            _userSearchResultFriendList = newValue
        }
    }
    
    var userSelectedFriendsCollectionViewData : [UserFriend] {
        
        get {
            return _userSelectedFriendsCollectionViewData
        }
        set {
            _userSelectedFriendsCollectionViewData = newValue
        }
    }
    
    var sectionDictionary : [String : [UserFriend]]  {
        
        get {
            return _sectionDictionary
        }
        set {
            _sectionDictionary = newValue
        }
    }
    
    var selectedFriendForDatabaseOperations : [String : UserFriend]  {
        
        get {
            return _selectedFriendForDatabaseOperations
        }
        set {
            _selectedFriendForDatabaseOperations = newValue
        }
    }
    
    var keyData : Array<String> {
        
        get {
            return _keyData
        }
        set {
            _keyData = newValue
        }
    }
    
    // userFriend lists according to letters
    var friendListInitial_A : [UserFriend] {
        
        get {
            return _friendListInitial_A
        }
        set {
            _friendListInitial_A = newValue
        }
    }
    
    var friendListInitial_B : [UserFriend] {
        
        get {
            return _friendListInitial_B
        }
        set {
            _friendListInitial_B = newValue
        }
    }
    
    var friendListInitial_C : [UserFriend] {
        
        get {
            return _friendListInitial_C
        }
        set {
            _friendListInitial_C = newValue
        }
    }
    
    var friendListInitial_D : [UserFriend] {
        
        get {
            return _friendListInitial_D
        }
        set {
            _friendListInitial_D = newValue
        }
    }
    
    var friendListInitial_E : [UserFriend] {
        
        get {
            return _friendListInitial_E
        }
        set {
            _friendListInitial_E = newValue
        }
    }
    
    var friendListInitial_F : [UserFriend] {
        
        get {
            return _friendListInitial_F
        }
        set {
            _friendListInitial_F = newValue
        }
    }
    
    var friendListInitial_G : [UserFriend] {
        
        get {
            return _friendListInitial_G
        }
        set {
            _friendListInitial_G = newValue
        }
    }
    
    var friendListInitial_H : [UserFriend] {
        
        get {
            return _friendListInitial_H
        }
        set {
            _friendListInitial_H = newValue
        }
    }
    
    var friendListInitial_I : [UserFriend] {
        
        get {
            return _friendListInitial_I
        }
        set {
            _friendListInitial_I = newValue
        }
    }
    
    var friendListInitial_J : [UserFriend] {
        
        get {
            return _friendListInitial_J
        }
        set {
            _friendListInitial_J = newValue
        }
    }
    
    var friendListInitial_K : [UserFriend] {
        
        get {
            return _friendListInitial_K
        }
        set {
            _friendListInitial_K = newValue
        }
    }
    
    var friendListInitial_L : [UserFriend] {
        
        get {
            return _friendListInitial_L
        }
        set {
            _friendListInitial_L = newValue
        }
    }
    
    var friendListInitial_M : [UserFriend] {
        
        get {
            return _friendListInitial_M
        }
        set {
            _friendListInitial_M = newValue
        }
    }
    
    var friendListInitial_N : [UserFriend] {
        
        get {
            return _friendListInitial_N
        }
        set {
            _friendListInitial_N = newValue
        }
    }
    
    var friendListInitial_O : [UserFriend] {
        
        get {
            return _friendListInitial_O
        }
        set {
            _friendListInitial_O = newValue
        }
    }
    
    var friendListInitial_P : [UserFriend] {
        
        get {
            return _friendListInitial_P
        }
        set {
            _friendListInitial_P = newValue
        }
    }
    
    var friendListInitial_Q : [UserFriend] {
        
        get {
            return _friendListInitial_Q
        }
        set {
            _friendListInitial_Q = newValue
        }
    }
    
    var friendListInitial_R : [UserFriend] {
        
        get {
            return _friendListInitial_R
        }
        set {
            _friendListInitial_R = newValue
        }
    }
    
    var friendListInitial_S : [UserFriend] {
        
        get {
            return _friendListInitial_S
        }
        set {
            _friendListInitial_S = newValue
        }
    }
    
    var friendListInitial_T : [UserFriend] {
        
        get {
            return _friendListInitial_T
        }
        set {
            _friendListInitial_T = newValue
        }
    }
    
    var friendListInitial_U : [UserFriend] {
        
        get {
            return _friendListInitial_U
        }
        set {
            _friendListInitial_U = newValue
        }
    }
    
    var friendListInitial_V : [UserFriend] {
        
        get {
            return _friendListInitial_V
        }
        set {
            _friendListInitial_V = newValue
        }
    }
    
    var friendListInitial_W : [UserFriend] {
        
        get {
            return _friendListInitial_W
        }
        set {
            _friendListInitial_W = newValue
        }
    }
    
    var friendListInitial_X : [UserFriend] {
        
        get {
            return _friendListInitial_X
        }
        set {
            _friendListInitial_X = newValue
        }
    }
    
    var friendListInitial_Y : [UserFriend] {
        
        get {
            return _friendListInitial_Y
        }
        set {
            _friendListInitial_Y = newValue
        }
    }
    
    var friendListInitial_Z : [UserFriend] {
        
        get {
            return _friendListInitial_Z
        }
        set {
            _friendListInitial_Z = newValue
        }
    }
    
    func sortDictionaryData() {
        
        _userFriendsDictionarySorted = _userFriendsDictionary.sorted(by:{ $0.userFriendChildData.userName < $1.userFriendChildData.userName})
        
    }
    
    func deleteDataFromInitialBasedFriendLists() {
        
        friendListInitial_A.removeAll()
        friendListInitial_B.removeAll()
        friendListInitial_C.removeAll()
        friendListInitial_D.removeAll()
        friendListInitial_E.removeAll()
        friendListInitial_F.removeAll()
        friendListInitial_G.removeAll()
        friendListInitial_H.removeAll()
        friendListInitial_I.removeAll()
        friendListInitial_J.removeAll()
        friendListInitial_K.removeAll()
        friendListInitial_L.removeAll()
        friendListInitial_M.removeAll()
        friendListInitial_N.removeAll()
        friendListInitial_O.removeAll()
        friendListInitial_P.removeAll()
        friendListInitial_Q.removeAll()
        friendListInitial_R.removeAll()
        friendListInitial_S.removeAll()
        friendListInitial_T.removeAll()
        friendListInitial_U.removeAll()
        friendListInitial_V.removeAll()
        friendListInitial_W.removeAll()
        friendListInitial_X.removeAll()
        friendListInitial_Y.removeAll()
        friendListInitial_Z.removeAll()
        
    }
    
}
