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
    private var _timeStamp : Int
    private var _postalCode : String
    private var _thorough : String
    private var _subThorough : String
    private var _latitude : Double
    private var _longitude : Double
    
    private var _locationDictionary : Dictionary<String, Any> = [:]
    
    init() {
        self._currentLocation = CLLocationCoordinate2D()
        self._isPinDropped = false
        self._userID = SPACE_CHARACTER
        self._countryCode = SPACE_CHARACTER
        self._countryName = SPACE_CHARACTER
        self._timeStamp = 0
        self._postalCode = SPACE_CHARACTER
        self._thorough = SPACE_CHARACTER
        self._subThorough = SPACE_CHARACTER
        self._latitude = DEFAULT_DOUBLE_VALUE
        self._longitude = DEFAULT_DOUBLE_VALUE
        
        self._locationId = SPACE_CHARACTER
        
    }
    
    var locationDictionary : Dictionary<String, Any> {
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
    
    var timeStamp : Int {
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
    
    func setTimestamp(inputTimestamp : Int) {
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
    
    func appendAttributeToDictionary(inputKey : String, inputValue : Any) {
        
        self._locationDictionary[inputKey] = inputValue
        
    }
    
    func getJSONObject() -> Dictionary<String, Any> {
        
        if !self._userID.isEmpty {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Users.UserID, inputValue: self._userID)
        }
        
        if !self._countryCode.isEmpty {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Locations.CountryCode, inputValue: self._countryCode)
        }
        
        if !self._countryName.isEmpty {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Locations.CountryName, inputValue: self._countryName)
        }
        
        if self._timeStamp > 0 {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Locations.Timestamp, inputValue: self._timeStamp)
        } else {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Locations.Timestamp, inputValue: [".sv": "timestamp"])
        }
        
        
        if !self._postalCode.isEmpty {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Locations.PostalCode, inputValue: self._postalCode)
        }
        
        if !self._thorough.isEmpty {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Locations.Thorough, inputValue: self._thorough)
        }
        
        if !self._subThorough.isEmpty {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Locations.SubThorough, inputValue: self._subThorough)
        }
        
        if !self._latitude.isZero {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Locations.Latitude, inputValue: self._latitude)
        }
        
        if !self._longitude.isZero {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Locations.Longitude, inputValue: self._longitude)
        }
        
        return locationDictionary
    }
    
    
    
}
