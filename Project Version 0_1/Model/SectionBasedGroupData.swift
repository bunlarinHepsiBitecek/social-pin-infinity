//
//  SectionBasedGroupData.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 2/24/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

var constantUserGroupDataObject = SectionBasedGroupData()

class SectionBasedGroupData {
    
    private var _user : User
    private var _userGroupList : [Group] = []
    private var _userGroupSortedList : [Group] = []
    private var _userGroupSortedDictionary : [String : Group] = [:]
    private var _keyData : Array<String>
    
    private var _sectionDictionaryForGroups = NSDictionary() as! [String : [Group]]
    
    private var _groupListInitial_A : [Group]
    private var _groupListInitial_B : [Group]
    private var _groupListInitial_C : [Group]
    private var _groupListInitial_D : [Group]
    private var _groupListInitial_E : [Group]
    private var _groupListInitial_F : [Group]
    private var _groupListInitial_G : [Group]
    private var _groupListInitial_H : [Group]
    private var _groupListInitial_I : [Group]
    private var _groupListInitial_J : [Group]
    private var _groupListInitial_K : [Group]
    private var _groupListInitial_L : [Group]
    private var _groupListInitial_M : [Group]
    private var _groupListInitial_N : [Group]
    private var _groupListInitial_O : [Group]
    private var _groupListInitial_P : [Group]
    private var _groupListInitial_Q : [Group]
    private var _groupListInitial_R : [Group]
    private var _groupListInitial_S : [Group]
    private var _groupListInitial_T : [Group]
    private var _groupListInitial_U : [Group]
    private var _groupListInitial_V : [Group]
    private var _groupListInitial_W : [Group]
    private var _groupListInitial_X : [Group]
    private var _groupListInitial_Y : [Group]
    private var _groupListInitial_Z : [Group]
    
    var user : User {
        get {
            return _user
        }
        set {
            _user = newValue
        }
    }
    
    var userGroupList : [Group] {
        get {
            return _userGroupList
        }
        set {
            _userGroupList = newValue
        }
    }
    
    var userGroupSortedList : [Group] {
        get {
            return _userGroupSortedList
        }
        set {
            _userGroupSortedList = newValue
        }
    }
    
    var userGroupSortedDictionary : [String : Group] {
        get {
            return _userGroupSortedDictionary
        }
        set {
            _userGroupSortedDictionary = newValue
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
    
    var sectionDictionaryForGroups : [String : [Group]] {
        get {
            return _sectionDictionaryForGroups
        }
        set {
            _sectionDictionaryForGroups = newValue
        }
    }
    
    init() {
        
        _user = User()
        _keyData = []
        
        _groupListInitial_A = []
        _groupListInitial_B = []
        _groupListInitial_C = []
        _groupListInitial_D = []
        _groupListInitial_E = []
        _groupListInitial_F = []
        _groupListInitial_G = []
        _groupListInitial_H = []
        _groupListInitial_I = []
        _groupListInitial_J = []
        _groupListInitial_K = []
        _groupListInitial_L = []
        _groupListInitial_M = []
        _groupListInitial_N = []
        _groupListInitial_O = []
        _groupListInitial_P = []
        _groupListInitial_Q = []
        _groupListInitial_R = []
        _groupListInitial_S = []
        _groupListInitial_T = []
        _groupListInitial_U = []
        _groupListInitial_V = []
        _groupListInitial_W = []
        _groupListInitial_X = []
        _groupListInitial_Y = []
        _groupListInitial_Z = []
        
    }
    
    // Group lists according to letters
    var groupListInitial_A : [Group] {
        
        get {
            return _groupListInitial_A
        }
        set {
            _groupListInitial_A = newValue
        }
    }
    
    var groupListInitial_B : [Group] {
        
        get {
            return _groupListInitial_B
        }
        set {
            _groupListInitial_B = newValue
        }
    }
    
    var groupListInitial_C : [Group] {
        
        get {
            return _groupListInitial_C
        }
        set {
            _groupListInitial_C = newValue
        }
    }
    
    var groupListInitial_D : [Group] {
        
        get {
            return _groupListInitial_D
        }
        set {
            _groupListInitial_D = newValue
        }
    }
    
    var groupListInitial_E : [Group] {
        
        get {
            return _groupListInitial_E
        }
        set {
            _groupListInitial_E = newValue
        }
    }
    
    var groupListInitial_F : [Group] {
        
        get {
            return _groupListInitial_F
        }
        set {
            _groupListInitial_F = newValue
        }
    }
    
    var groupListInitial_G : [Group] {
        
        get {
            return _groupListInitial_G
        }
        set {
            _groupListInitial_G = newValue
        }
    }
    
    var groupListInitial_H : [Group] {
        
        get {
            return _groupListInitial_H
        }
        set {
            _groupListInitial_H = newValue
        }
    }
    
    var groupListInitial_I : [Group] {
        
        get {
            return _groupListInitial_I
        }
        set {
            _groupListInitial_I = newValue
        }
    }
    
    var groupListInitial_J : [Group] {
        
        get {
            return _groupListInitial_J
        }
        set {
            _groupListInitial_J = newValue
        }
    }
    
    var groupListInitial_K : [Group] {
        
        get {
            return _groupListInitial_K
        }
        set {
            _groupListInitial_K = newValue
        }
    }
    
    var groupListInitial_L : [Group] {
        
        get {
            return _groupListInitial_L
        }
        set {
            _groupListInitial_L = newValue
        }
    }
    
    var groupListInitial_M : [Group] {
        
        get {
            return _groupListInitial_M
        }
        set {
            _groupListInitial_M = newValue
        }
    }
    
    var groupListInitial_N : [Group] {
        
        get {
            return _groupListInitial_N
        }
        set {
            _groupListInitial_N = newValue
        }
    }
    
    var groupListInitial_O : [Group] {
        
        get {
            return _groupListInitial_O
        }
        set {
            _groupListInitial_O = newValue
        }
    }
    
    var groupListInitial_P : [Group] {
        
        get {
            return _groupListInitial_P
        }
        set {
            _groupListInitial_P = newValue
        }
    }
    
    var groupListInitial_Q : [Group] {
        
        get {
            return _groupListInitial_Q
        }
        set {
            _groupListInitial_Q = newValue
        }
    }
    
    var groupListInitial_R : [Group] {
        
        get {
            return _groupListInitial_R
        }
        set {
            _groupListInitial_R = newValue
        }
    }
    
    var groupListInitial_S : [Group] {
        
        get {
            return _groupListInitial_S
        }
        set {
            _groupListInitial_S = newValue
        }
    }
    
    var groupListInitial_T : [Group] {
        
        get {
            return _groupListInitial_T
        }
        set {
            _groupListInitial_T = newValue
        }
    }
    
    var groupListInitial_U : [Group] {
        
        get {
            return _groupListInitial_U
        }
        set {
            _groupListInitial_U = newValue
        }
    }
    
    var groupListInitial_V : [Group] {
        
        get {
            return _groupListInitial_V
        }
        set {
            _groupListInitial_V = newValue
        }
    }
    
    var groupListInitial_W : [Group] {
        
        get {
            return _groupListInitial_W
        }
        set {
            _groupListInitial_W = newValue
        }
    }
    
    var groupListInitial_X : [Group] {
        
        get {
            return _groupListInitial_X
        }
        set {
            _groupListInitial_X = newValue
        }
    }
    
    var groupListInitial_Y : [Group] {
        
        get {
            return _groupListInitial_Y
        }
        set {
            _groupListInitial_Y = newValue
        }
    }
    
    var groupListInitial_Z : [Group] {
        
        get {
            return _groupListInitial_Z
        }
        set {
            _groupListInitial_Z = newValue
        }
    }
    
    func sortUserGroupList() {
        
        _userGroupSortedList = _userGroupList.sorted(by: { $0.groupName < $1.groupName })
        
    }
    
    func loadSortedDictionary() {
        
        for item in _userGroupSortedList {
            
            _userGroupSortedDictionary[item.groupID] = item
            
        }
        
    }
    
}
