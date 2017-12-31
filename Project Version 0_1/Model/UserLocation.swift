//
//  UserLocation.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 17.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

class UserLocation {
    
    private var _userID : String
    private var _userLocationID : String
    
    private var _userLocationDictionary : Dictionary<String, String> = [:]
    
    init() {
        
        self._userID = SPACE_CHARACTER
        self._userLocationID = SPACE_CHARACTER
        
    }
    
    var userID : String {
        return _userID
    }
    
    var userLocationID : String {
        return _userLocationID
    }
    
    var userLocationDictionary : Dictionary<String, String> {
        return _userLocationDictionary
    }
    
    func setUserID(inputUserID :String) {
        self._userID = inputUserID
    }
    
    func setUserLocationID(inputUserLocationID : String) {
        self._userLocationID = inputUserLocationID
    }
    
    func appendAttributeToDictionary(inputKey : String, inputValue : String) {
        self._userLocationDictionary[inputKey] = inputValue
    }
    
    func getJSONObject() -> Dictionary<String, String> {
        
        if !self._userLocationID.isEmpty {
            self.appendAttributeToDictionary(inputKey: self.userLocationID, inputValue: self._userLocationID)
        }
        
        return userLocationDictionary
    }
    
}
