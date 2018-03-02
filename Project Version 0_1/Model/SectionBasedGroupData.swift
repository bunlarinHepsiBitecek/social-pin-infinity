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
    
    func createSectionsForGroups() {
        
        for userGroupObject in constantUserGroupDataObject.userGroupSortedList {
            
            if userGroupObject.groupName.hasPrefix(LetterConstants.A) {
                
                constantUserGroupDataObject.groupListInitial_A.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.B){
                
                constantUserGroupDataObject.groupListInitial_B.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.C) {
                
                constantUserGroupDataObject.groupListInitial_C.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.D){
                
                constantUserGroupDataObject.groupListInitial_D.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.E) {
                
                constantUserGroupDataObject.groupListInitial_E.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.F){
                
                constantUserGroupDataObject.groupListInitial_F.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.G) {
                
                constantUserGroupDataObject.groupListInitial_G.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.H){
                
                constantUserGroupDataObject.groupListInitial_H.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.I) {
                
                constantUserGroupDataObject.groupListInitial_I.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.J){
                
                constantUserGroupDataObject.groupListInitial_J.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.K) {
                
                constantUserGroupDataObject.groupListInitial_K.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.L){
                
                constantUserGroupDataObject.groupListInitial_L.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.M) {
                
                constantUserGroupDataObject.groupListInitial_M.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.N){
                
                constantUserGroupDataObject.groupListInitial_N.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.O) {
                
                constantUserGroupDataObject.groupListInitial_O.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.P){
                
                constantUserGroupDataObject.groupListInitial_P.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.Q) {
                
                constantUserGroupDataObject.groupListInitial_Q.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.R) {
                
                constantUserGroupDataObject.groupListInitial_R.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.S){
                
                constantUserGroupDataObject.groupListInitial_S.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.T) {
                
                constantUserGroupDataObject.groupListInitial_T.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.U){
                
                constantUserGroupDataObject.groupListInitial_U.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.V) {
                
                constantUserGroupDataObject.groupListInitial_V.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.W){
                
                constantUserGroupDataObject.groupListInitial_W.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.X) {
                
                constantUserGroupDataObject.groupListInitial_X.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.Y){
                
                constantUserGroupDataObject.groupListInitial_Y.append(userGroupObject)
                
            } else if userGroupObject.groupName.hasPrefix(LetterConstants.Z) {
                
                constantUserGroupDataObject.groupListInitial_Z.append(userGroupObject)
                
            }
            
        }
        
        if constantUserGroupDataObject.groupListInitial_A.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.A] = constantUserGroupDataObject.groupListInitial_A
            
        }
        
        if constantUserGroupDataObject.groupListInitial_B.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.B] = constantUserGroupDataObject.groupListInitial_B
            
        }
        
        if constantUserGroupDataObject.groupListInitial_C.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.C] = constantUserGroupDataObject.groupListInitial_C
            
        }
        
        if constantUserGroupDataObject.groupListInitial_D.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.D] = constantUserGroupDataObject.groupListInitial_D
            
        }
        
        if constantUserGroupDataObject.groupListInitial_E.count > 0 {
            
            print("e count : \(constantUserGroupDataObject.groupListInitial_E.count)")
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.E] = constantUserGroupDataObject.groupListInitial_E
            
        }
        
        if constantUserGroupDataObject.groupListInitial_F.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.F] = constantUserGroupDataObject.groupListInitial_F
            
        }
        
        if constantUserGroupDataObject.groupListInitial_G.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.G] = constantUserGroupDataObject.groupListInitial_G
            
        }
        
        if constantUserGroupDataObject.groupListInitial_H.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.H] = constantUserGroupDataObject.groupListInitial_H
            
        }
        
        if constantUserGroupDataObject.groupListInitial_I.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.I] = constantUserGroupDataObject.groupListInitial_I
            
        }
        
        if constantUserGroupDataObject.groupListInitial_J.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.J] = constantUserGroupDataObject.groupListInitial_J
            
        }
        
        if constantUserGroupDataObject.groupListInitial_K.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.K] = constantUserGroupDataObject.groupListInitial_K
            
        }
        
        if constantUserGroupDataObject.groupListInitial_L.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.L] = constantUserGroupDataObject.groupListInitial_L
            
        }
        
        if constantUserGroupDataObject.groupListInitial_M.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.M] = constantUserGroupDataObject.groupListInitial_M
            
        }
        
        if constantUserGroupDataObject.groupListInitial_N.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.N] = constantUserGroupDataObject.groupListInitial_N
            
        }
        
        if constantUserGroupDataObject.groupListInitial_O.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.O] = constantUserGroupDataObject.groupListInitial_O
            
        }
        
        if constantUserGroupDataObject.groupListInitial_P.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.P] = constantUserGroupDataObject.groupListInitial_P
            
        }
        
        if constantUserGroupDataObject.groupListInitial_Q.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.Q] = constantUserGroupDataObject.groupListInitial_Q
            
        }
        
        if constantUserGroupDataObject.groupListInitial_R.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.R] = constantUserGroupDataObject.groupListInitial_R
            
        }
        
        if constantUserGroupDataObject.groupListInitial_S.count > 0 {
            
            print("s count : \(constantUserGroupDataObject.groupListInitial_S.count)")
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.S] = constantUserGroupDataObject.groupListInitial_S
            
        }
        
        if constantUserGroupDataObject.groupListInitial_T.count > 0 {
            
            print("t count : \(constantUserGroupDataObject.groupListInitial_T.count)")
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.T] = constantUserGroupDataObject.groupListInitial_T
            
        }
        
        if constantUserGroupDataObject.groupListInitial_U.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.U] = constantUserGroupDataObject.groupListInitial_U
            
        }
        
        if constantUserGroupDataObject.groupListInitial_V.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.V] = constantUserGroupDataObject.groupListInitial_V
            
        }
        
        if constantUserGroupDataObject.groupListInitial_W.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.W] = constantUserGroupDataObject.groupListInitial_W
            
        }
        
        if constantUserGroupDataObject.groupListInitial_X.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.X] = constantUserGroupDataObject.groupListInitial_X
            
        }
        
        if constantUserGroupDataObject.groupListInitial_Y.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.Y] = constantUserGroupDataObject.groupListInitial_Y
            
        }
        
        if constantUserGroupDataObject.groupListInitial_Z.count > 0 {
            
            constantUserGroupDataObject.sectionDictionaryForGroups[LetterConstants.Z] = constantUserGroupDataObject.groupListInitial_Z
            
        }
        
        constantUserGroupDataObject.keyData = Array(constantUserGroupDataObject.sectionDictionaryForGroups.keys).sorted()
        
    }
    
    func calculateNumberOfSectionsForGroups(inputSectionValue : Int) -> Int {
        
        if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.A {
            
            return constantUserGroupDataObject.groupListInitial_A.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.B {
            
            return constantUserGroupDataObject.groupListInitial_B.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.C {
            
            return constantUserGroupDataObject.groupListInitial_C.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.D {
            
            return constantUserGroupDataObject.groupListInitial_D.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.E {
            
            print("constantUserGroupDataObject.groupListInitial_E.count : \(constantUserGroupDataObject.groupListInitial_E.count)")
            return constantUserGroupDataObject.groupListInitial_E.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.F {
            
            return constantUserGroupDataObject.groupListInitial_F.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.G {
            
            return constantUserGroupDataObject.groupListInitial_G.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.H {
            
            return constantUserGroupDataObject.groupListInitial_H.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.I {
            
            return constantUserGroupDataObject.groupListInitial_I.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.J {
            
            return constantUserGroupDataObject.groupListInitial_J.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.K {
            
            return constantUserGroupDataObject.groupListInitial_K.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.L {
            
            return constantUserGroupDataObject.groupListInitial_L.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.M {
            
            return constantUserGroupDataObject.groupListInitial_M.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.N {
            
            return constantUserGroupDataObject.groupListInitial_N.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.O {
            
            return constantUserGroupDataObject.groupListInitial_O.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.P {
            
            return constantUserGroupDataObject.groupListInitial_P.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.Q {
            
            return constantUserGroupDataObject.groupListInitial_Q.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.R {
            
            return constantUserGroupDataObject.groupListInitial_R.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.S {
            
            return constantUserGroupDataObject.groupListInitial_S.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.T {
            
            return constantUserGroupDataObject.groupListInitial_T.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.U {
            
            return constantUserGroupDataObject.groupListInitial_U.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.V {
            
            return constantUserGroupDataObject.groupListInitial_V.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.W {
            
            return constantUserGroupDataObject.groupListInitial_W.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.X {
            
            return constantUserGroupDataObject.groupListInitial_X.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.Y {
            
            return constantUserGroupDataObject.groupListInitial_Y.count
            
        } else if constantUserGroupDataObject.keyData[inputSectionValue] == LetterConstants.Z {
            
            return constantUserGroupDataObject.groupListInitial_Z.count
            
        } else {
            
            return 0
            
        }
        
    }
    
    func arrangeSectionDataForGroupSegment(inputIndexPath : IndexPath) -> Group {
        
        if inputIndexPath.section == 0 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
            
        } else if inputIndexPath.section == 1 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 2 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 3 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 4 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 5 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 6 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 7 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 8 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 9 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 10 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 11 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 12 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 13 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 14 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 15 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 16 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 17 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 18 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 19 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 20 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 21 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 22 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 23 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 24 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 25 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else if inputIndexPath.section == 26 {
            
            return constantUserGroupDataObject.sectionDictionaryForGroups[constantUserGroupDataObject.keyData[inputIndexPath.section]]![inputIndexPath.row]
            
        } else {
            
            return Group()
            
        }
        
    }
}
