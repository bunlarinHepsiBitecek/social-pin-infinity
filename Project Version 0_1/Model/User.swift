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
    private var _gender : String
    private var _birthday : String
    private var _userProfilePicture : UIImage
    private var _userProfilePictureUrl : String
    private var _userProfilePictureUniqueID : String
    private var _userPassword : String
    
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
        self._userPassword = SPACE_CHARACTER
        
        self._userProfilePicture = UIImage()
        
    }
    
    init(inputUserID : String, inputUserName : String, inputUserNameSurname : String, inputUserEmail : String, inputUserGender : String, inputUserBirthday : String, inputUserProfilePicture : UIImage, inputUserProfilePictureUrl : String, inputUserProfilePictureUniqueID : String) {
        
        self._userID = inputUserID
        self._userName = inputUserName
        self._userNameSurname = inputUserNameSurname
        self._email = inputUserEmail
        self._gender = inputUserGender
        self._birthday = inputUserBirthday
        self._userProfilePicture = inputUserProfilePicture
        self._userProfilePictureUrl = inputUserProfilePictureUrl
        self._userProfilePictureUniqueID = inputUserProfilePictureUniqueID
        self._userPassword = SPACE_CHARACTER
        
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
    
    var userPassword : String {
        return _userPassword
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
    
    func setUserPassword(inputUserPassword : String) {
        
        self._userPassword = inputUserPassword
        
    }
    
    func setEmailAndPassword(inputUserEmail : String, inputUserPassword : String) {
        
        self._email = inputUserEmail
        self._userPassword = inputUserPassword
        
    }
    
    func displayAttributeValues() {
        
        print("email : \(self._email)")
        print("userID : \(self._userID)")
        print("url : \(self._userProfilePictureUrl)")
        
    }
    
    func setUserProfilePictureUniqueID(inputUserProfilePictureUniqueID : String) {
        
        self._userProfilePictureUniqueID = inputUserProfilePictureUniqueID
        
    }
    
}
