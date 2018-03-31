//
//  Location.swift
//  Project Version 0_1
//
//  Created by Remzi on 16/12/2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import MapKit

enum PinType: String {
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

class Location {
    
    private var _locationId : String
    
    private var _currentLocation: CLLocationCoordinate2D
    private var _isPinDropped: Bool
    
    private var _userID : String
    private var _countryCode : String
    private var _countryName : String
    private var _cityName : String
    private var _timeStamp : Int
    private var _postalCode : String
    private var _thorough : String
    private var _subThorough : String
    private var _latitude : Double
    private var _longitude : Double
    private var _pinType : PinType
    private var _toWhom : [String]
    private var _pictureURL : String
    private var _textPictureURL : String
    private var _videoPictureURL : String
    private var _videoURL : String
    private var _text : String
    
    private var _locationDictionary : Dictionary<String, Any> = [:]
    
    init() {
        self._currentLocation = CLLocationCoordinate2D()
        self._isPinDropped = false
        self._userID = SPACE_CHARACTER
        self._countryCode = SPACE_CHARACTER
        self._countryName = SPACE_CHARACTER
        self._cityName = SPACE_CHARACTER
        self._timeStamp = DEFAULT_INTEGER_VALUE
        self._postalCode = SPACE_CHARACTER
        self._thorough = SPACE_CHARACTER
        self._subThorough = SPACE_CHARACTER
        self._latitude = DEFAULT_DOUBLE_VALUE
        self._longitude = DEFAULT_DOUBLE_VALUE
        
        self._locationId = SPACE_CHARACTER
        
        self._pinType = .me
        self._toWhom = []
        self._pictureURL = SPACE_CHARACTER
        self._videoPictureURL = SPACE_CHARACTER
        self._videoURL = SPACE_CHARACTER
        self._textPictureURL = SPACE_CHARACTER
        self._text = SPACE_CHARACTER
        
    }
    
    //init(snapshot : DataSnapshot, userID: String) {
    
    init(data : Dictionary<String, Any>, locationID : String ) {
        //print("Location sınıfındayım snapvalue : \(String(describing: snapshot.value))")
        print("Location sınıfındayım locID: \(locationID)")
        
        self._isPinDropped = false
        
        self._locationId = locationID
        self._userID = data[FirebaseModelConstants.Locations.UserID] as? String ?? SPACE_CHARACTER
        self._countryCode = data[FirebaseModelConstants.Locations.CountryCode] as? String ?? SPACE_CHARACTER
        self._countryName = data[FirebaseModelConstants.Locations.CountryName] as? String ?? SPACE_CHARACTER
        self._cityName = data[FirebaseModelConstants.Locations.CityName] as? String ?? SPACE_CHARACTER
        self._timeStamp = DEFAULT_INTEGER_VALUE
        self._postalCode = data[FirebaseModelConstants.Locations.PostalCode] as? String ?? SPACE_CHARACTER
        self._thorough = data[FirebaseModelConstants.Locations.Thorough] as? String ?? SPACE_CHARACTER
        self._subThorough = data[FirebaseModelConstants.Locations.SubThorough] as? String ?? SPACE_CHARACTER
        self._latitude = data[FirebaseModelConstants.Locations.Latitude] as? Double ?? DEFAULT_DOUBLE_VALUE
        self._longitude = data[FirebaseModelConstants.Locations.Longitude] as? Double ?? DEFAULT_DOUBLE_VALUE
        self._currentLocation = CLLocationCoordinate2D(latitude: self._latitude, longitude: self._latitude)
        
        self._pinType = data[FirebaseModelConstants.Locations.PinType] as? PinType ?? .me
        self._toWhom = data[FirebaseModelConstants.Locations.ToWhom] as? [String] ?? []
        self._pictureURL = data[FirebaseModelConstants.Locations.PictureURL] as? String ?? SPACE_CHARACTER
        self._videoPictureURL = data[FirebaseModelConstants.Locations.VideoPictureURL] as? String ?? SPACE_CHARACTER
        self._textPictureURL = data[FirebaseModelConstants.Locations.TextPictureURL] as? String ?? SPACE_CHARACTER
        self._videoURL = data[FirebaseModelConstants.Locations.VideoURL] as? String ?? SPACE_CHARACTER
        self._text = data[FirebaseModelConstants.Locations.Text] as? String ?? SPACE_CHARACTER
        
        print("--------------------------Location")
        print(userID,self._countryCode,self._countryName, self._postalCode,locationId, self._latitude, self._longitude)
        print("--------------------------Location")
    }
    
    var locationDictionary : Dictionary<String, Any> {
        get {
            return self._locationDictionary
        }
        set(inputValue) {
            self._locationDictionary = inputValue
        }
    }
    
    var locationId : String {
        get {
            return self._locationId
        }
        set(inputValue) {
            self._locationId = inputValue
        }
    }
    
    var currenLocation : CLLocationCoordinate2D {
        get {
            return self._currentLocation
        }
        set(inputValue) {
            self._currentLocation = inputValue
        }
    }
    
    var isPinDropped : Bool {
        get {
            return self._isPinDropped
        }
        set(inputValue) {
            self._isPinDropped = inputValue
        }
    }
    
    var userID : String {
        get {
            return self._userID
        }
        set(inputValue) {
            self._userID = inputValue
        }
    }
    
    var countryCode : String {
        get {
            return self._countryCode
        }
        set(inputValue) {
            self._countryCode = inputValue
        }
    }
    
    var countryName : String {
        get {
            return self._countryName
        }
        set(inputValue) {
            self._countryName = inputValue
        }
    }
    
    var cityName: String {
        get {
            return self._cityName
        }
        set {
            self._cityName = newValue
        }
    }
    
    var postalCode : String {
        get {
            return self._postalCode
        }
        set(inputValue) {
            self._postalCode = inputValue
        }
    }
    
    var thorough : String {
        get {
            return self._thorough
        }
        set(inputValue) {
            self._thorough = inputValue
        }
    }
    
    var subThorough : String {
        get {
            return self._subThorough
        }
        set(inputValue) {
            self._subThorough = inputValue
        }
    }
    
    var timeStamp : Int {
        get {
            return self._timeStamp
        }
        set(inputValue) {
            self._timeStamp = inputValue
        }
    }
    
    var latitude : Double {
        get {
            return self._latitude
        }
        set(inputValue) {
            self._latitude = inputValue
        }
    }
    
    var longitude : Double {
        get {
            return self._longitude
        }
        set(inputValue) {
            self._longitude = inputValue
        }
    }
    
    var pinType : PinType {
        get {
            return self._pinType
        }
        set {
            self._pinType = newValue
        }
    }
    
    var toWhom : [String] {
        get {
            return self._toWhom
        }
        set {
            self._toWhom = newValue
        }
    }
    var pictureURL : String {
        get {
            return self._pictureURL
        }
        set {
            self._pictureURL = newValue
        }
    }
    var videoPictureURL : String {
        get {
            return self._videoPictureURL
        }
        set {
            self._videoPictureURL = newValue
        }
    }
    var textPictureURL : String {
        get {
            return self._textPictureURL
        }
        set {
            self._textPictureURL = newValue
        }
    }
    var videoURL : String {
        get {
            return self._videoURL
        }
        set {
            self._videoURL = newValue
        }
    }
    var text : String {
        get {
            return self._text
        }
        set {
            self._text = newValue
        }
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
        
        if !self._cityName.isEmpty {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Locations.CityName, inputValue: self._cityName)
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
