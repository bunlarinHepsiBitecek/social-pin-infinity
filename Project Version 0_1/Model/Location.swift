//
//  Location.swift
//  Project Version 0_1
//
//  Created by Remzi on 16/12/2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import MapKit

class Location {
    
    /*
    private var _locationId: String {
        return NSUUID().uuidString
    }*/
    
    private var _locationId : String
    
    private var _currentLocation: CLLocationCoordinate2D
    private var _isPinDropped: Bool
    
    private var _userID : String
    private var _countryCode : String
    private var _countryName : String
    private var _timeStamp : String
    private var _postalCode : String
    private var _thorough : String
    private var _subThorough : String
    private var _latitude : Double
    private var _longitude : Double
    
    private var _locationDictionary : Dictionary<String, String> = [:]
    
    init() {
        self._currentLocation = CLLocationCoordinate2D()
        self._isPinDropped = false
        self._userID = SPACE_CHARACTER
        self._countryCode = SPACE_CHARACTER
        self._countryName = SPACE_CHARACTER
        self._timeStamp = SPACE_CHARACTER
        self._postalCode = SPACE_CHARACTER
        self._thorough = SPACE_CHARACTER
        self._subThorough = SPACE_CHARACTER
        self._latitude = DEFAULT_DOUBLE_VALUE
        self._longitude = DEFAULT_DOUBLE_VALUE
        
        self._locationId = SPACE_CHARACTER
        
    }
    
    var locationDictionary : Dictionary<String, String> {
        return _locationDictionary
    }
    
    var locationId: String {
        return self._locationId
    }
    
    var currenLocation: CLLocationCoordinate2D {
        return self._currentLocation
    }
    
    var isPinDropped: Bool {
        return self._isPinDropped
    }
    
    var userID : String {
        return _userID
    }
    
    var countryCode : String {
        return _countryCode
    }
    
    var countryName : String {
        return _countryName
    }
    
    var timeStamp : String {
        return _timeStamp
    }
    
    var postalCode : String {
        return _postalCode
    }
    
    var thorough : String {
        return _thorough
    }
    
    var subThorough : String {
        return _subThorough
    }
    
    var latitude : Double {
        return _latitude
    }
    
    var longitude : Double {
        return _longitude
    }
    
    func setLocationId(inputLocationId: String) {
        self._locationId = inputLocationId
    }
    
    func setIsPinDropped(isPinDropped: Bool) {
        self._isPinDropped = isPinDropped
    }
    
    func setCurrentLocation(locationCoordinate: CLLocationCoordinate2D) {
        self._currentLocation = locationCoordinate
    }
    
    func setUserID(inputUserID : String) {
        self._userID = inputUserID
    }
    
    func setCountryCode(inputCountryCode : String) {
        self._countryCode = inputCountryCode
    }
    
    func setCountryName(inputCountryName : String) {
        self._countryName = inputCountryName
    }
    
    func setTimestamp(inputTimestamp : String) {
        self._timeStamp = inputTimestamp
    }
    
    func setPostalCode(inputPostalCode : String) {
        self._postalCode = inputPostalCode
    }
    
    func setThorough(inputThorough : String) {
        self._thorough = inputThorough
    }
    
    func setSubThorough(inputSubThorough : String) {
        self._subThorough = inputSubThorough
    }
    
    func setLatitude(inputLatitude : Double) {
        self._latitude = inputLatitude
    }
    
    func setLongitude(inputLongitude : Double) {
        self._longitude = inputLongitude
    }
    
    func appendAttributeToDictionary(inputKey : String, inputValue : String) {
        
        self._locationDictionary[inputKey] = inputValue
        
    }
    
    func getUserJSONObject() -> Dictionary<String, String> {
        
        if !self._userID.isEmpty {
            self.appendAttributeToDictionary(inputKey: CONSTANT_STRING_USERID, inputValue: self._userID)
        }
        
        if !self._countryCode.isEmpty {
            self.appendAttributeToDictionary(inputKey: CONSTANT_STRING_COUNTRY_CODE, inputValue: self._countryCode)
        }
        
        if !self._countryName.isEmpty {
            self.appendAttributeToDictionary(inputKey: CONSTANT_STRING_COUNTRY_NAME, inputValue: self._countryName)
        }
        
        if !self._timeStamp.isEmpty {
            self.appendAttributeToDictionary(inputKey: CONSTANT_STRING_TIMESTAMP, inputValue: self._timeStamp)
        }
        
        if !self._postalCode.isEmpty {
            self.appendAttributeToDictionary(inputKey: CONSTANT_STRING_POSTAL_CODE, inputValue: self._postalCode)
        }
        
        if !self._thorough.isEmpty {
            self.appendAttributeToDictionary(inputKey: CONSTANT_STRING_THOROUGH, inputValue: self._thorough)
        }
        
        if !self._subThorough.isEmpty {
            self.appendAttributeToDictionary(inputKey: CONSTANT_STRING_SUB_THOROUGH, inputValue: self._subThorough)
        }
        
        if !self._latitude.isZero {
            self.appendAttributeToDictionary(inputKey: CONSTANT_STRING_LATITUDE, inputValue: String(self._latitude))
        }
        
        if !self._longitude.isZero {
            self.appendAttributeToDictionary(inputKey: CONSTANT_STRING_LONGITUDE, inputValue: String(self._longitude))
        }
        
        return locationDictionary
        
    }
    
    
    
}
