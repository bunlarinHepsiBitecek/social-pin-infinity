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
let cachedGroupImages = NSCache<NSString, UIImage>()
let cachedGroupMemberImages = NSCache<NSString, UIImage>()

var friendSelectedDictionary = NSDictionary() as! [String : Bool]

var selectedFriendArray = [UserFriend]()
var friendsData = SectionBasedFriendsData()

class SectionBasedFriendsData {
    
    private var _userFriendsDictionary : [UserFriend]
    private var _userFriendsDictionarySorted : [UserFriend]
    private var _userSearchResultFriendList : [UserFriend]
    private var _userSelectedFriendsCollectionViewData : [UserFriend]
    private var _sectionDictionary = NSDictionary() as! [String : [UserFriend]]
    private var _selectedFriendForDatabaseOperations = NSDictionary() as! [String : UserFriend]
    private var _keyData : Array<String>
    //private var _booleanArrayForSelectedFriendList = [[Bool]]()
    
    private var _isAnyFriendDeletedFromGroupCreationView : Bool
    
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
        
        _isAnyFriendDeletedFromGroupCreationView = false
        
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
    
    var isAnyFriendDeletedFromGroupCreationView : Bool {
        
        get {
            return _isAnyFriendDeletedFromGroupCreationView
        }
        set {
            _isAnyFriendDeletedFromGroupCreationView = newValue
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
    
    func sortSearchResultData() {
        
        _userSearchResultFriendList = _userSearchResultFriendList.sorted(by: { $0.userFriendChildData.userName < $1.userFriendChildData.userName})
        
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
    
    // parse data and append users related letter based arrays
    func createSectionLists() {
        
        print("createSectionLists starts")
        
        friendsData.sortDictionaryData()
        
        for userFriendObject in friendsData.userFriendsDictionarySorted {
            
            if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.A) {
                
                friendsData.friendListInitial_A.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.B){
                
                friendsData.friendListInitial_B.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.C) {
                
                friendsData.friendListInitial_C.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.D){
                
                friendsData.friendListInitial_D.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.E) {
                
                friendsData.friendListInitial_E.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.F){
                
                friendsData.friendListInitial_F.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.G) {
                
                friendsData.friendListInitial_G.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.H){
                
                friendsData.friendListInitial_H.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.I) {
                
                friendsData.friendListInitial_I.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.J){
                
                friendsData.friendListInitial_J.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.K) {
                
                friendsData.friendListInitial_K.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.L){
                
                friendsData.friendListInitial_L.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.M) {
                
                friendsData.friendListInitial_M.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.N){
                
                friendsData.friendListInitial_N.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.O) {
                
                friendsData.friendListInitial_O.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.P){
                
                friendsData.friendListInitial_P.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.Q) {
                
                friendsData.friendListInitial_Q.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.R) {
                
                friendsData.friendListInitial_R.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.S){
                
                friendsData.friendListInitial_S.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.T) {
                
                friendsData.friendListInitial_T.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.U){
                
                friendsData.friendListInitial_U.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.V) {
                
                friendsData.friendListInitial_V.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.W){
                
                friendsData.friendListInitial_W.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.X) {
                
                friendsData.friendListInitial_X.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.Y){
                
                friendsData.friendListInitial_Y.append(userFriendObject)
                
            } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.Z) {
                
                friendsData.friendListInitial_Z.append(userFriendObject)
                
            }
            
        }
        
        if friendsData.friendListInitial_A.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.A] = friendsData.friendListInitial_A
            
        }
        
        if friendsData.friendListInitial_B.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.B] = friendsData.friendListInitial_B
            
        }
        
        if friendsData.friendListInitial_C.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.C] = friendsData.friendListInitial_C
            
        }
        
        if friendsData.friendListInitial_D.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.D] = friendsData.friendListInitial_D
            
        }
        
        if friendsData.friendListInitial_E.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.E] = friendsData.friendListInitial_E
            
        }
        
        if friendsData.friendListInitial_F.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.F] = friendsData.friendListInitial_F
            
        }
        
        if friendsData.friendListInitial_G.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.G] = friendsData.friendListInitial_G
            
        }
        
        if friendsData.friendListInitial_H.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.H] = friendsData.friendListInitial_H
            
        }
        
        if friendsData.friendListInitial_I.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.I] = friendsData.friendListInitial_I
            
        }
        
        if friendsData.friendListInitial_J.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.J] = friendsData.friendListInitial_J
            
        }
        
        if friendsData.friendListInitial_K.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.K] = friendsData.friendListInitial_K
            
        }
        
        if friendsData.friendListInitial_L.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.L] = friendsData.friendListInitial_L
            
        }
        
        if friendsData.friendListInitial_M.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.M] = friendsData.friendListInitial_M
            
        }
        
        if friendsData.friendListInitial_N.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.N] = friendsData.friendListInitial_N
            
        }
        
        if friendsData.friendListInitial_O.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.O] = friendsData.friendListInitial_O
            
        }
        
        if friendsData.friendListInitial_P.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.P] = friendsData.friendListInitial_P
            
        }
        
        if friendsData.friendListInitial_Q.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.Q] = friendsData.friendListInitial_Q
            
        }
        
        if friendsData.friendListInitial_R.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.R] = friendsData.friendListInitial_R
            
        }
        
        if friendsData.friendListInitial_S.count > 0 {
            
            
            friendsData.sectionDictionary[LetterConstants.S] = friendsData.friendListInitial_S
            
        }
        
        if friendsData.friendListInitial_T.count > 0 {
            
            
            friendsData.sectionDictionary[LetterConstants.T] = friendsData.friendListInitial_T
            
        }
        
        if friendsData.friendListInitial_U.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.U] = friendsData.friendListInitial_U
            
        }
        
        if friendsData.friendListInitial_V.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.V] = friendsData.friendListInitial_V
            
        }
        
        if friendsData.friendListInitial_W.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.W] = friendsData.friendListInitial_W
            
        }
        
        if friendsData.friendListInitial_X.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.X] = friendsData.friendListInitial_X
            
        }
        
        if friendsData.friendListInitial_Y.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.Y] = friendsData.friendListInitial_Y
            
        }
        
        if friendsData.friendListInitial_Z.count > 0 {
            
            friendsData.sectionDictionary[LetterConstants.Z] = friendsData.friendListInitial_Z
            
        }
        
        friendsData.keyData = Array(friendsData.sectionDictionary.keys).sorted()
        
    }
    
    // calculate and return number of rows for a specific sections
    func calculateNumberOfRowsInSection(inputSectionValue : Int) -> Int {
        
        if friendsData.keyData[inputSectionValue] == LetterConstants.A {
            
            return friendsData.friendListInitial_A.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.B {
            
            return friendsData.friendListInitial_B.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.C {
            
            return friendsData.friendListInitial_C.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.D {
            
            return friendsData.friendListInitial_D.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.E {
            
            print("friendsData.friendListInitial_E.count : \(friendsData.friendListInitial_E.count)")
            return friendsData.friendListInitial_E.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.F {
            
            return friendsData.friendListInitial_F.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.G {
            
            return friendsData.friendListInitial_G.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.H {
            
            return friendsData.friendListInitial_H.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.I {
            
            return friendsData.friendListInitial_I.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.J {
            
            return friendsData.friendListInitial_J.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.K {
            
            return friendsData.friendListInitial_K.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.L {
            
            return friendsData.friendListInitial_L.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.M {
            
            return friendsData.friendListInitial_M.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.N {
            
            return friendsData.friendListInitial_N.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.O {
            
            return friendsData.friendListInitial_O.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.P {
            
            return friendsData.friendListInitial_P.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.Q {
            
            return friendsData.friendListInitial_Q.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.R {
            
            return friendsData.friendListInitial_R.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.S {
            
            return friendsData.friendListInitial_S.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.T {
            
            return friendsData.friendListInitial_T.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.U {
            
            return friendsData.friendListInitial_U.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.V {
            
            return friendsData.friendListInitial_V.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.W {
            
            return friendsData.friendListInitial_W.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.X {
            
            return friendsData.friendListInitial_X.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.Y {
            
            return friendsData.friendListInitial_Y.count
            
        } else if friendsData.keyData[inputSectionValue] == LetterConstants.Z {
            
            return friendsData.friendListInitial_Z.count
            
        } else {
            
            return 0
            
        }
        
    }
    
    // arrange section data for related index of sectionDictionary
    func arrangeSectionsInitialsBased(inputIndexPath : IndexPath) -> UserFriend {
        
        if inputIndexPath.section == NumberOrSections.section0 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section1 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section2 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section3 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section4 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section5 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section6 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section7 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section8 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section9 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section10 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section11 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section12 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section13 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section14 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section15 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section16 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section17 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section18 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section19 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section20 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section21 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section22 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section23 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section24 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section25 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == NumberOrSections.section26 {
            
            return friendsData.sectionDictionary[friendsData.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else {
            
            return UserFriend()
            
        }
        
    }
    
    /*
    func resetBooleanArray() {
     
        _booleanArrayForSelectedFriendList = Array(repeating: false, count: friendsData.userFriendsDictionary.count)

    }*/
    
    func resetSelectedFriendBooleanData() {
        
        for item in friendsData.userFriendsDictionarySorted {
            
            friendSelectedDictionary[item.userID] = false
            
        }
        
    }
    
    
}
