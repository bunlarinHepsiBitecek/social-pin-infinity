//
//  PinModels.swift
//  Project Version 0_1
//
//  Created by Remzi on 06/01/2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import Foundation

enum PinTypes: String {
    case friends, person, me, group
    
    public var stringValue: String {
        switch self {
        case .friends:
            return "friends"
        case .person:
            return "person"
        case .me:
            return "me"
        case .group:
            return "group"
        }
    }
}

class PinModels {
    
    private var _locationID : String
    private var _notified : Bool
    private var _owner : String
    private var _pinType : PinTypes
    private var _toWhom : [String]
    
    init() {
        self._locationID = SPACE_CHARACTER
        self._notified = true
        self._owner = SPACE_CHARACTER
        self._pinType = .me
        self._toWhom = []
    }
    
    init(snapshot : Dictionary<String, Any>, locationID : String ) {
        //print("Location sınıfındayım snapvalue : \(String(describing: snapshot.value))")
        print("PinModels sınıfındayım locID: \(locationID)")
        let data = snapshot
        self._locationID = locationID
        self._notified = data[FirebaseModelConstants.PinModels.Notified] as? Bool ?? false
        self._owner = data[FirebaseModelConstants.PinModels.Owner] as? String ?? SPACE_CHARACTER
        self._pinType = data[FirebaseModelConstants.PinModels.PinType] as? PinTypes ?? .me
        self._toWhom = data[FirebaseModelConstants.PinModels.Owner] as? [String] ?? []
    }
    
    var locationID : String {
        get {
            return self._locationID
        }
        set(inputValue) {
            self._locationID = inputValue
        }
    }
}
