//
//  NotificationSent.swift
//  Project Version 0_1
//
//  Created by Remzi on 06/01/2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import Foundation

class NotificationSent {
    private var _locationID : String
    private var _timestamp : Double
    private var _notificationSentDictionary : Dictionary<String, Any> = [:]
    
    init() {
        self._locationID = SPACE_CHARACTER
        self._timestamp = 0
    }
    
    var locationID : String {
        get {
            return self._locationID
        }
        set(inputValue) {
            self._locationID = inputValue
        }
    }
    
    var timestamp : Double {
        get {
            return self._timestamp
        }
        set(inputValue) {
            self._timestamp = inputValue
        }
    }
    
    func appendAttributeToDictionary(inputKey : String, inputValue : Any) {
        
        self._notificationSentDictionary[inputKey] = inputValue
        
    }
    
    func getJSONObject() -> Dictionary<String, Any> {
        if !self._timestamp.isZero {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.NotificationSent.Timestamp, inputValue: [".sv": "timestamp"])
        }
        
        return self._notificationSentDictionary
    }
}
