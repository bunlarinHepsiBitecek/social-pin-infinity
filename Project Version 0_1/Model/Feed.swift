//
//  Feed.swift
//  Project Version 0_1
//
//  Created by Remzi on 17/02/2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import Foundation

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

class Feed {
    
    private var _locationID : String
    private var _notified : Bool
    private var _owner : String
    private var _pinType : PinType
    private var _toWhom : [String]
    private var _pictureURL : String
    private var _textPictureURL : String
    private var _videoPictureURL : String
    private var _videoURL : String
    private var _text : String
    private var _ownerUser : OwnerUser
    
    init() {
        self._locationID = SPACE_CHARACTER
        self._notified = true
        self._owner = SPACE_CHARACTER
        self._pinType = .me
        self._toWhom = []
        self._pictureURL = SPACE_CHARACTER
        self._videoPictureURL = SPACE_CHARACTER
        self._textPictureURL = SPACE_CHARACTER
        self._videoURL = SPACE_CHARACTER
        self._text = SPACE_CHARACTER
        self._ownerUser = OwnerUser(userID: "abcd", userName: "Deneme UserName", userNameSurname: "", email: "", profilePictureURL: "")
    
    }
    
    init(snapshot : Dictionary<String, Any>, locationID : String ) {
        //print("Location sınıfındayım snapvalue : \(String(describing: snapshot.value))")
        print("Feed sınıfındayım locID: \(locationID)")
        let data = snapshot
        self._locationID = locationID
        self._notified = data[FirebaseModelConstants.PinModels.Notified] as? Bool ?? false
        self._owner = data[FirebaseModelConstants.PinModels.Owner] as? String ?? SPACE_CHARACTER
        self._pinType = data[FirebaseModelConstants.PinModels.PinType] as? PinType ?? .me
        self._toWhom = data[FirebaseModelConstants.PinModels.Owner] as? [String] ?? []
        self._pictureURL = data[FirebaseModelConstants.PinModels.PictureURL] as? String ?? SPACE_CHARACTER
        self._videoPictureURL = data[FirebaseModelConstants.PinModels.VideoPictureURL] as? String ?? SPACE_CHARACTER
        self._textPictureURL = data[FirebaseModelConstants.PinModels.TextPictureURL] as? String ?? SPACE_CHARACTER
        self._videoURL = data[FirebaseModelConstants.PinModels.VideoURL] as? String ?? SPACE_CHARACTER
        self._text = data[FirebaseModelConstants.PinModels.Text] as? String ?? SPACE_CHARACTER
        
        let imageUrlString = "https://firebasestorage.googleapis.com/v0/b/social-media-infinity.appspot.com/o/Users%2FProfileImages%2F291BF881-8A4B-4C7E-8584-62D9B79A621A.png?alt=media&token=e55de74d-52ba-4e29-aed0-204a1ae009be"
        self._ownerUser = OwnerUser(userID: "abcd", userName: "Deneme UserName", userNameSurname: "", email: "", profilePictureURL: imageUrlString)
        
    }
    
    var locationID : String {
        get {
            return self._locationID
        }
        set {
            self._locationID = newValue
        }
    }
    
    var notified : Bool {
        get {
            return self._notified
        }
        set {
            self._notified = newValue
        }
    }
    
    var owner : String {
        get {
            return self._owner
        }
        set {
            self._owner = newValue
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
    var ownerUser : OwnerUser {
        get {
            return self._ownerUser
        }
        set {
            self._ownerUser = newValue
        }
    }
    
}

struct OwnerUser {
    let userID : String
    let userName : String
    let userNameSurname : String
    let email : String
    let profilePictureURL : String
}

/*
struct PinModelStruct: Decodable {
    let location : LocationStrut
    let notified : Bool
    let owner : String
    let pinType : String
    let toWhom : [String]
}

struct LocationStrut: Decodable {
    let locationId : String
    let userID : String
    let countryCode : String
    let countryName : String
    let timestamp : Int
    let postalCode : String
    let thorough : String
    let subThorough : String
    let latitude : Double
    let longitude : Double
} */
