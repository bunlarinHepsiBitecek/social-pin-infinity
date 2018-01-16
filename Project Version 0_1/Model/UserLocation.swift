//
//  UserLocation.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 17.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import FirebaseDatabase

class UserLocation {
    
    private var _userID : String
    private var _userLocationID : String
    
    private var _userLocationDictionary : Dictionary<String, Any> = [:]
    
    init() {
        self._userID = SPACE_CHARACTER
        self._userLocationID = SPACE_CHARACTER
    }
    
    init(snapshot : DataSnapshot, userID: String) {
        self._userID = userID
        self._userLocationID = snapshot.key
        
        //let data = snapshot.value as! Dictionary<String, Any>
    }
    
    
    var userID : String {
        get {
            return self._userID
        }
        set(inputValue) {
            self._userID = inputValue
        }
    }
    
    var userLocationID : String {
        get {
            return self._userLocationID
        }
        set(inputValue) {
            self._userLocationID = inputValue
        }
    }
    
    var userLocationDictionary : Dictionary<String, Any> {
        get {
            return self._userLocationDictionary
        }
        set(inputValue) {
            self._userLocationDictionary = inputValue
        }
    }
    
    func appendAttributeToDictionary(inputKey : String, inputValue : Any) {
        self._userLocationDictionary[inputKey] = inputValue
    }
    
    func getJSONObject() -> Dictionary<String, Any> {
        
        if !self._userLocationID.isEmpty {
            self.appendAttributeToDictionary(inputKey: self.userLocationID, inputValue: true)
        }
        
        return userLocationDictionary
    }
    
}
