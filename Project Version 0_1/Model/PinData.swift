//
//  PinData.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 23.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import MapKit

class PinData {
    
    private var _user : User
    private var _location : Location
    private var _pictureOnPin : UIImage
    private var _pictureUrlOnPin : NSURL
    private var _pictureIDOnPin : String
    private var _textCaptureIDOnPin : String
    private var _textCaptureUrlOnPin : NSURL
    private var _textOnPin : String
    private var _textCaptureImage : UIImage
    private var _videoExistFlag : Bool
    private var _videoIDOnPin : String
    private var _videoDataUrlOnPin : NSURL
    private var _videoDataUrlFirebaseOnPin : NSURL
    private var _videoCapture : UIImage
    private var _isPinDataUploadedDatabase : Bool
    private var _isPinDropped : Bool
    private var _isPictureExist : Bool
    private var _isCapturedTextExist : Bool
    private var _currentLocation: CLLocationCoordinate2D
    
    private var _pinItemsDictionary : Dictionary<String, String> = [:]
    
    init() {
        
        self._user = User()
        self._location = Location()
        self._pictureOnPin = UIImage()
        self._pictureUrlOnPin = NSURL()
        self._textCaptureIDOnPin = SPACE_CHARACTER
        self._textCaptureUrlOnPin = NSURL()
        self._textOnPin = SPACE_CHARACTER
        self._videoExistFlag = false
        self._videoDataUrlOnPin = NSURL()
        self._videoDataUrlFirebaseOnPin = NSURL()
        self._videoIDOnPin = SPACE_CHARACTER
        self._pictureIDOnPin = SPACE_CHARACTER
        self._isPinDataUploadedDatabase = false
        self._isPinDropped = false
        self._isPictureExist = false
        self._currentLocation = CLLocationCoordinate2D()
        self._videoCapture = UIImage()
        self._textCaptureImage = UIImage()
        self._isCapturedTextExist = false
        
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
    
    var textCaptureIDOnPin : String {
        return self._textCaptureIDOnPin
    }
    
    var textCaptureURL : NSURL {
        return self._textCaptureUrlOnPin
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
    
    var videoDataUrlFirebase : NSURL {
        return _videoDataUrlFirebaseOnPin
    }
    
    var videoIDOnPin : String {
        return _videoIDOnPin
    }
    
    var isPinDataUploadedDatabase : Bool {
        return _isPinDataUploadedDatabase
    }
    
    var isPinDropped : Bool {
        return _isPinDropped
    }
    
    var isPictureExist : Bool {
        return _isPictureExist
    }
    
    var currentLocation : CLLocationCoordinate2D {
        return _currentLocation
    }
    
    var videoCapture : UIImage {
        return _videoCapture
    }
    
    var textCaptureImage : UIImage {
        return _textCaptureImage
    }
    
    var isCapturedTextExist : Bool {
        return _isCapturedTextExist
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
    
    func setTextCaptureIDOnPin(inputTextCaptureIDOnPin: String) {
        self._textCaptureIDOnPin = inputTextCaptureIDOnPin
    }
    
    func setTextCaptureURLOnPin(inputTextCaptureURL: NSURL) {
        self._textCaptureUrlOnPin = inputTextCaptureURL
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
    
    func setVideoDataUrlFirebase(inputVideoDataUrlFirebase : NSURL) {
        self._videoDataUrlFirebaseOnPin = inputVideoDataUrlFirebase
    }
    
    func setVideoIDOnPin(inputVideoIDOnPin : String) {
        self._videoIDOnPin = inputVideoIDOnPin
    }
    
    func appendAttributeToDictionary(inputKey : String, inputValue : String) {
        self._pinItemsDictionary[inputKey] = inputValue
    }
    
    func setPinDataUploadedDatabase(inputBooleanValue : Bool) {
        self._isPinDataUploadedDatabase = inputBooleanValue
    }
    
    func isPinDropped(inputBooleanValue : Bool) {
        self._isPinDropped = inputBooleanValue
    }
    
    func setCurrentLocation(inputCurrentlocation : CLLocationCoordinate2D) {
        self._currentLocation = inputCurrentlocation
    }
    
    func isPictureExist(inputBooleanValue : Bool) {
        print("isPictureExist starts")
        self._isPictureExist = inputBooleanValue
    }
    
    func setVideoCapture(inputCapturedImage : UIImage) {
        self._videoCapture = inputCapturedImage
    }
    
    func setTextCaptureImage(inputCapturedImage : UIImage) {
        self._textCaptureImage = inputCapturedImage
    }
    
    func isCapturedTextExist(inputBooleanValue : Bool) {
        self._isCapturedTextExist = inputBooleanValue
    }
        
    func getJSONObject() -> Dictionary<String, String> {
        
        if !self._pictureIDOnPin.isEmpty {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.PinItem.pictureID, inputValue: self._pictureIDOnPin)
        }
        
        if let pictureURL = self._pictureUrlOnPin.absoluteString, !pictureURL.isEmpty {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.PinItem.pictureURL, inputValue: pictureURL)
        }
        
        
        if !self._videoIDOnPin.isEmpty {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.PinItem.videoID, inputValue: self._videoIDOnPin)
        }
        
        if let videoURL = self._videoDataUrlFirebaseOnPin.absoluteString, !videoURL.isEmpty {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.PinItem.videoURL, inputValue: videoURL)
        }
        
        if !self._textOnPin.isEmpty {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.PinItem.text, inputValue: self._textOnPin)
        }
        
        if !self._textCaptureIDOnPin.isEmpty {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.PinItem.textID, inputValue: self._textCaptureIDOnPin)
        }
        
        if let textImageURL = self._textCaptureUrlOnPin.absoluteString, !textImageURL.isEmpty {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.PinItem.textURL, inputValue: textImageURL)
        }
        
        return _pinItemsDictionary
    }
    
    func resetPinDataFlags() {
        
        self._isPinDropped = false
        self._isPinDataUploadedDatabase = false
        self._isPictureExist = false
        self._isCapturedTextExist = false
        self._videoExistFlag = false
        self.setTextOnPin(inputTextOnPin: SPACE_CHARACTER)
        
        
    }
    
}
