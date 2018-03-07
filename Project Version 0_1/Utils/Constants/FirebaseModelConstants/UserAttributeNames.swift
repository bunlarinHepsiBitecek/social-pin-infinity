//
//  UserAttributeNames.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 25.11.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import Foundation

/*
let CONSTANT_STRING_USERID : String = "userID"
let CONSTANT_USERNAME : String = "userName"
let CONSTANT_NAME_SURNAME : String = "nameSurname"
let CONSTANT_SURNAME : String = "surname"
let CONSTANT_GENDER : String = "gender"
let CONSTANT_BIRTHDAY : String = "birthday"
let CONSTANT_EMAIL : String = "email"
let CONSTANT_URL : String = "profilePictureUrl"
let CONSTANT_PASSWORD : String = "password"
let CONSTANT_MOBILEPHONE : String = "mobilephone"
let CONSTANT_PROVIDER : String = "provider"
let CONSTANT_PROVIDER_ID : String = "providerId"
let CONSTANT_PROFILE_PICTURE_ID : String = "profilePictureId"
 */

/*
let CONSTANT_STRING_COUNTRY_CODE : String = "countryCode"
let CONSTANT_STRING_COUNTRY_NAME : String = "countryName"
let CONSTANT_STRING_TIMESTAMP : String = "timestamp"
let CONSTANT_STRING_POSTAL_CODE : String = "postalCode"
let CONSTANT_STRING_THOROUGH : String = "thorough"
let CONSTANT_STRING_SUB_THOROUGH : String = "subThorough"
let CONSTANT_STRING_GEOLOCATION : String = "geolocation"
let CONSTANT_STRING_LATITUDE : String = "latitude"
let CONSTANT_STRING_LONGITUDE : String = "longitude"

let CONSTANT_STRING_LOCATION : String = "Location"
*/

/*
let CONSTANT_STRING_PICTURE : String = "picture"
let CONSTANT_STRING_VIDEO : String = "video"
let CONSTANT_STRING_TEXT : String = "text"
 */

struct FirebaseConstants {
    struct Email {
        //let EMAIL_VERIFICATON_URL = "gotoVerify://social-media-infinity.firebaseapp.com?email=%@"
        static let EmailVerifitactionURL = "gotoVerify://social-media-infinity.firebaseapp.com?email=%@"
    }
}

struct FirebaseModels {
    struct Users {
        static let CHILD_USERS = "Users"
    }
    
    struct Locations {
        static let CHILD_LOCATIONS = "Locations"
    }
    
    struct PinItems {
        static let childPinItems = "PinItems"
    }
    
    struct Friends {
        static let childFriends : String = "Friends"
    }
    
    struct Groups {
        static let childGroups = "Groups"
    }
    
    struct UserGroups {
        static let childUserGroups = "UserGroups"
    }
    
    struct PinModels {
        static let childPinModels = "PinModels"
    }
    
    struct NotificationSent {
        static let childNotificationSent = "NotificationSent"
    }
}

struct FirebaseModelConstants {
    static let Timestamp = "timestamp"
    
    struct Users {
        static let UserID : String = "userID"
        static let UserName : String = "userName"
        static let NameSurname : String = "nameSurname"
        static let Surname : String = "surname"
        static let Gender : String = "gender"
        static let Birthday : String = "birthday"
        static let Email : String = "email"
        static let ProfilePictureUrl : String = "profilePictureUrl"
        static let Password : String = "password"
        static let MobilePhone : String = "mobilephone"
        static let Provider : String = "provider"
        static let ProviderID : String = "providerId"
        static let ProfilePictureID : String = "profilePictureId"
    }
    
    struct Locations {
        static let Location : String = "Location"
        static let CountryCode : String = "countryCode"
        static let CountryName : String = "countryName"
        static let Timestamp : String = "timestamp"
        static let PostalCode : String = "postalCode"
        static let Thorough : String = "thorough"
        static let SubThorough : String = "subThorough"
        static let Geolocation : String = "geolocation"
        static let Latitude : String = "latitude"
        static let Longitude : String = "longitude"
        static let UserID : String = "userID"
    }
    
    struct PinItem {
        static let pictureID = "pictureId"
        static let pictureURL = "pictureURL"
        static let videoID = "videoId"
        static let videoURL = "videoURL"
        static let textID = "textId"
        static let textURL = "textURL"
        static let text = "text"
    }
    
    struct PinModels {
        static let Notified = "notified"
        static let Owner = "owner"
        static let PinType = "pinType"
        static let ToWhom = "toWhom"
    }
    
    struct NotificationSent {
        static let Timestamp = "timestamp"
    }
    
    struct Groups {
        
        static let Admin = "Admin"
        static let GroupName = "GroupName"
        static let GroupPictureUrl = "GroupPictureUrl"
        static let UserList = "UserList"
        static let NameSurname = "NameSurname"
        static let profilePictureUrl = "profilePictureUrl"
        
    }
    
}

