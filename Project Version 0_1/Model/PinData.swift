//
//  PinData.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 23.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit


class PinData {
    
    private var _user : User
    private var _location : Location
    private var _pictureOnPin : UIImage
    private var _pictureUrlOnPin : NSURL
    private var _pictureIDOnPin : String
    private var _textOnPin : String
    private var _videoExistFlag : Bool
    private var _videoIDOnPin : String
    private var _videoDataUrlOnPin : NSURL
    private var _pinDataUploadedDatabase : Bool
    private var _isPinDropped : Bool
    
    private var _pinItemsDictionary : Dictionary<String, String> = [:]
    
    init() {
        
        self._user = User()
        self._location = Location()
        self._pictureOnPin = UIImage()
        self._pictureUrlOnPin = NSURL()
        self._textOnPin = SPACE_CHARACTER
        self._videoExistFlag = false
        self._videoDataUrlOnPin = NSURL()
        self._videoIDOnPin = SPACE_CHARACTER
        self._pictureIDOnPin = SPACE_CHARACTER
        self._pinDataUploadedDatabase = false
        self._isPinDropped = false
        
    }

    var user : User {
        return _user
    }
    
    var location : Location {
        return _location
    }
    
    var pictureOnPin : UIImage {
        return _pictureOnPin
    }
    
    var pictureOnPinUrl : NSURL {
        return _pictureUrlOnPin
    }
    
    var pictureIDOnPin : String {
        return _pictureIDOnPin
    }
    
    var textOnPin : String {
        return _textOnPin
    }
    
    var videoExistFlag : Bool {
        return _videoExistFlag
    }
    
    var videoDataUrl : NSURL {
        return _videoDataUrlOnPin
    }
    
    var videoIDOnPin : String {
        return _videoIDOnPin
    }
    
    var pinDataUploadedDatabase : Bool {
        return _pinDataUploadedDatabase
    }
    
    var isPinDropped : Bool {
        return _isPinDropped
    }
    
    func setUser(inputUserObj : User) {
        self._user = inputUserObj
    }
    
    func setLocation(inputLocationObj : Location) {
        self._location = inputLocationObj
    }
    
    func setPictureOnPin(inputPictureOnPin : UIImage) {
        self._pictureOnPin = inputPictureOnPin
    }
    
    func setPictureOnPinUrl(inputPictureUrl : NSURL) {
        self._pictureUrlOnPin = inputPictureUrl
    }
    
    func setPictureIDOnPin(inputPictureIDOnPin : String) {
        self._pictureIDOnPin = inputPictureIDOnPin
    }
    
    func setTextOnPin(inputTextOnPin : String) {
        self._textOnPin = inputTextOnPin
    }
    
    func setVideoExistFlag(inputVideoExistFlag : Bool) {
        self._videoExistFlag = inputVideoExistFlag
    }
    
    func setVideoDataUrl(inputVideoDataUrl : NSURL) {
        self._videoDataUrlOnPin = inputVideoDataUrl
    }
    
    func setVideoIDOnPin(inputVideoIDOnPin : String) {
        self._videoIDOnPin = inputVideoIDOnPin
    }
    
    func appendAttributeToDictionary(inputKey : String, inputValue : String) {
        self._pinItemsDictionary[inputKey] = inputValue
    }
    
    func setPinDataUploadedDatabase(inputBooleanValue : Bool) {
        self._pinDataUploadedDatabase = inputBooleanValue
    }
    
    func isPinDropped(inputBooleanValue : Bool) {
        self._isPinDropped = inputBooleanValue
    }
        
    func getUserJSONObject() -> Dictionary<String, String> {
        
        if !self._pictureIDOnPin.isEmpty {
            self.appendAttributeToDictionary(inputKey: CONSTANT_STRING_PICTURE, inputValue: self._pictureIDOnPin)
        }
        
        if !self._videoIDOnPin.isEmpty {
            self.appendAttributeToDictionary(inputKey: CONSTANT_STRING_VIDEO, inputValue: self._videoIDOnPin)
        }
        
        if !self._textOnPin.isEmpty {
            self.appendAttributeToDictionary(inputKey: CONSTANT_STRING_TEXT, inputValue: self._textOnPin)
        }
        
        return _pinItemsDictionary
    }
    
}
