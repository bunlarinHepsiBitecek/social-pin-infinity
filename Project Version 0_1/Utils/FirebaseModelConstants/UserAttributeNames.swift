//
//  UserAttributeNames.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 25.11.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import Foundation

struct FirebaseConstants {
    struct Email {
        //let EMAIL_VERIFICATON_URL = "gotoVerify://social-media-infinity.firebaseapp.com?email=%@"
        static let EmailVerifitactionURL = "gotoVerify://social-media-infinity.firebaseapp.com?email=%@"
    }
    
    struct Query {
        static let LastItemCount : UInt = UInt(5)
        static let NextItemCount : UInt = UInt(6)
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
        static let childFriends = "Friends"
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
    
    struct Feed {
        static let childFeed = "Feed"
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
        static let PictureURL = "pictureURL"
        static let VideoPictureURL = "videoPictureURL"
        static let TextPictureURL = "textURL"
        static let VideoURL = "videoURL"
        static let Text = "text"
        static let PinType = "pinType"
        static let ToWhom = "toWhom"
    }
    
    struct PinItem {
        static let pictureID = "pictureId"
        static let pictureURL = "pictureURL"
        static let videoID = "videoId"
        static let videoURL = "videoURL"
        static let videoPictureURL = "videoPictureURL"
        static let textID = "textId"
        static let textURL = "textURL"
        static let text = "text"
    }
    
    struct PinModels {
        static let Notified = "notified"
        static let Owner = "owner"
        static let PinType = "pinType"
        static let ToWhom = "toWhom"
        static let Timestamp = "timestamp"
        static let PictureURL = "pictureURL"
        static let VideoPictureURL = "videoPictureURL"
        static let TextPictureURL = "textURL"
        static let VideoURL = "videoURL"
        static let Text = "text"
    }
    
    struct Feed {
        static let Timestamp = "timestamp"
        
    }
    
    struct NotificationSent {
        static let Timestamp = "timestamp"
    }
}

