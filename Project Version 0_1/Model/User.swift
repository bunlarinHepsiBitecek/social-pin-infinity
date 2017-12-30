//
//  User.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 24.11.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import Foundation
import UIKit

class User {
    
    private var _userID : String
    private var _userName : String
    private var _userNameSurname : String
    private var _email : String
    private var _password : String
    private var _gender : String
    private var _birthday : String
    private var _mobilePhone : String
    private var _provider: String
    private var _providerId: String
    private var _userProfilePicture : UIImage
    private var _userProfilePictureUrl : String
    private var _userProfilePictureUniqueID : String
    private var _userLocationObject: Location
    private var _isUserGetInformedFromGuidence : Bool
    
    private var _userDictionary : Dictionary<String, String> = [:]
    
    init() {
        
        self._userID = SPACE_CHARACTER
        self._userName = SPACE_CHARACTER
        self._userNameSurname = SPACE_CHARACTER
        self._email = SPACE_CHARACTER
        self._gender = SPACE_CHARACTER
        self._birthday = SPACE_CHARACTER
        self._userProfilePictureUrl = SPACE_CHARACTER
        self._userProfilePictureUniqueID = SPACE_CHARACTER
        self._password = SPACE_CHARACTER
        self._mobilePhone = SPACE_CHARACTER
        self._provider = SPACE_CHARACTER
        self._providerId = SPACE_CHARACTER
        
        self._userProfilePicture = UIImage()
        self._userLocationObject = Location()
        
        self._isUserGetInformedFromGuidence = false
    }
    
    func printUserInfo() {
        print(FirebaseModelConstants.Users.UserID + " :" + _userID)
        print(FirebaseModelConstants.Users.UserName + " :" + _userName)
        print(FirebaseModelConstants.Users.NameSurname + " :" + _userNameSurname)
        print(FirebaseModelConstants.Users.Email + " :" + _email)
        print(FirebaseModelConstants.Users.Password + " :" + _password)
        print(FirebaseModelConstants.Users.Gender + " :" + _gender)
        print(FirebaseModelConstants.Users.Birthday + " :" + _birthday)
        print(FirebaseModelConstants.Users.MobilePhone + " :" + _mobilePhone)
        print(FirebaseModelConstants.Users.Provider + " :" + _provider)
        print(FirebaseModelConstants.Users.ProviderID + " :" + _providerId)
        print(FirebaseModelConstants.Users.ProfilePictureUrl + ":" + _userProfilePictureUrl)
    }
    
    var userID : String {
        return _userID
    }
    
    var username : String {
        return _userName
    }
    
    var userNameSurname : String {
        return _userNameSurname
    }
    
    var email : String {
        return _email
    }
    
    var gender : String {
        return _gender
    }
    
    var birthday : String {
        return _birthday
    }
    
    var userDictionary : Dictionary<String, String> {
        return _userDictionary
    }
    
    var userProfilePicture : UIImage {
        return _userProfilePicture
    }
    
    var userProfilePictureUrl : String {
        return _userProfilePictureUrl
    }
    
    var userProfilePictureUniqueID : String {
        return _userProfilePictureUniqueID
    }
    
    var password : String {
        return _password
    }
    
    var mobilePhone : String {
        return _mobilePhone
    }
    
    var provider: String {
        return _provider
    }
    
    var providerId: String {
        return _providerId
    }
    
    /*
    var userLocationObject: Location {
        return _userLocationObject
    }
 */
    
    var isUserGetInformedFromGuidence : Bool {
        return _isUserGetInformedFromGuidence
    }
    
    func setUserID(inputUserID : String) {
        
        self._userID = inputUserID
        
    }
    
    func setUserName(inputName : String) {
        
        self._userName = inputName
        
    }
    
    func setUserNameSurname(inputNameSurname : String) {
        
        self._userNameSurname = inputNameSurname
        
    }
    
    func setUserEmail(inputEmail : String) {
        
        self._email = inputEmail
        
    }
    
    func setUserGender(inputUserGender : String) {
        
        self._gender = inputUserGender
        
    }
    
    func setUserBirthday(inputUserBirthday : String) {
        
        self._birthday = inputUserBirthday
        
    }
    
    func setUserProfilePicture(inputUserProfileImage : UIImage) {
        
        self._userProfilePicture = inputUserProfileImage
        
    }
    
    func setUserProfilePictureUrl(inputUrl : String) {
        
        self._userProfilePictureUrl = inputUrl
    }
    
    
    func appendAttributeToDictionary(inputKey : String, inputValue : String) {
        
        self._userDictionary[inputKey] = inputValue
        
    }
    
    func setUserPassword(inputPassword : String) {
        
        self._password = inputPassword
        
    }
    
    func setEmailAndPassword(inputUserEmail : String, inputUserPassword : String) {
        
        self._email = inputUserEmail
        self._password = inputUserPassword
        
    }
    
    func setUserMobilePhone(inputUserMobilePhone : String) {
        self._mobilePhone = inputUserMobilePhone
    }
    
    func setUserProvider(inputUserProvider: String) {
        self._provider = inputUserProvider
    }
    
    func setUserProviderId(inputUserProviderId: String) {
        self._providerId = inputUserProviderId
    }
    
    func isUserGetInformedFromGuidence(inputBooleanValue : Bool) {
        self._isUserGetInformedFromGuidence = inputBooleanValue
    }
    
    func displayAttributeValues() {
        
        print("email : \(self._email)")
        print("userID : \(self._userID)")
        print("url : \(self._userProfilePictureUrl)")
        
    }
    
    func setUserProfilePictureUniqueID(inputUserProfilePictureUniqueID : String) {
        
        self._userProfilePictureUniqueID = inputUserProfilePictureUniqueID
        
    }
    
    func getUserJSONObject() -> Dictionary<String, String> {
        if self._userName != SPACE_CHARACTER {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Users.UserName, inputValue: self._userName)
        }
        
        if self._userNameSurname != SPACE_CHARACTER {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Users.NameSurname, inputValue: self._userNameSurname)
        }
        
        if self._gender != SPACE_CHARACTER {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Users.Gender, inputValue: self._gender)
        }
        
        if self._birthday != SPACE_CHARACTER {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Users.Birthday, inputValue: self._birthday)
        }
        
        if self._userProfilePictureUrl != SPACE_CHARACTER {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Users.ProfilePictureUrl, inputValue: self._userProfilePictureUrl)
        }
        
        if self._userProfilePictureUniqueID != SPACE_CHARACTER {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Users.ProfilePictureID, inputValue: self._userProfilePictureUniqueID)
        }
        
        if self._mobilePhone != SPACE_CHARACTER {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Users.MobilePhone, inputValue: self._mobilePhone)
        }
        
        if self._provider != SPACE_CHARACTER {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Users.Provider, inputValue: self._provider)
        }
        
        if self._providerId != SPACE_CHARACTER {
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Users.ProviderID, inputValue: self._providerId)
        }
        
        return userDictionary
    }
    
}

