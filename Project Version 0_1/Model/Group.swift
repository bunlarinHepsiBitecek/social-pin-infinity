//
//  Group.swift
//  Project Version 0_1
//
//  Created by Remzi on 06/01/2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import Foundation

class Group {
    private var _groupID : String
    private var _adminUserID : String
    private var _members : [String] // Contains member of group
    
    init() {
        self._groupID = SPACE_CHARACTER
        self._adminUserID = SPACE_CHARACTER
        self._members = []
    }
    
    var groupID : String {
        get {
            return self._groupID
        }
        set(inputValue) {
            self._groupID = inputValue
        }
    }
    
    var adminUserID : String {
        get {
            return self._adminUserID
        }
        set(inputValue) {
            self._adminUserID = inputValue
        }
    }
    
    var members : [String] {
        get {
            return self._members
        }
        set(inputValue) {
            self._members = inputValue
        }
    }
}
