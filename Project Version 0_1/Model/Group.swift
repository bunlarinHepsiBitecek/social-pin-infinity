//
//  Group.swift
//  Project Version 0_1
//
//  Created by Remzi on 06/01/2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import Foundation

class Group {
    private var _groupID : String
    private var _isGroupActive : Bool
    private var _adminUserID : String
    private var _groupName : String
    private var _members : [String] // Contains member of group
    private var _groupPictureUrl : String
    private var _groupMembers : [UserFriend] = []
    private var _isGroupDataExists : Bool
    
    private var _groupDictionary : Dictionary<String, String> = [:]
    
    init(dataDictionary : [String : Any], inputGroupIDValue : String) {
        
        self._groupID =  inputGroupIDValue
        self._members = []
        self._isGroupDataExists = false
        self._isGroupActive = false
        
        self._adminUserID = dataDictionary["Admin"] as? String ?? ""
        self._groupName = dataDictionary["GroupName"] as? String ?? ""
        self._groupPictureUrl = dataDictionary["GroupPictureUrl"] as? String ?? ""
        
        let temp = dataDictionary["UserList"]
        
        let tempUserFriend = UserFriend()
        
        if let tempData = temp as? NSDictionary {
            
            for item in tempData {
                
                tempUserFriend.userID = item.key as! String
                
                let tempUserFriendChildData = item.value as! [String : Any]
                
                tempUserFriend.userFriendChildData.userImageUrl = tempUserFriendChildData["profilePictureUrl"] as! String
                tempUserFriend.userFriendChildData.userName = tempUserFriendChildData["nameSurname"] as! String
            
                self._groupMembers.append(tempUserFriend)
                
            }
        }
    }
    
    
    init() {
        self._groupID = SPACE_CHARACTER
        self._isGroupActive = false
        self._adminUserID = SPACE_CHARACTER
        self._groupName = SPACE_CHARACTER
        self._members = []
        self._groupPictureUrl = SPACE_CHARACTER
        self._groupMembers = []
        self._isGroupDataExists = false
    }
    
    var groupID : String {
        get {
            return self._groupID
        }
        set(inputValue) {
            self._groupID = inputValue
        }
    }
    
    var isGroupActive : Bool {
        get {
            return _isGroupActive
        }
        set {
            _isGroupActive = newValue
        }
    }
    
    var adminUserID : String {
        get {
            return self._adminUserID
        }
        set(inputValue) {
            self._adminUserID = inputValue
        }
    }
    
    var groupName : String {
        get {
            return self._groupName
        }
        set {
            self._groupName = newValue
        }
    }
    
    var members : [String] {
        get {
            return self._members
        }
        set(inputValue) {
            self._members = inputValue
        }
    }
    
    var groupPictureUrl : String {
        get {
            return self._groupPictureUrl
        }
        set(inputValue) {
            self._groupPictureUrl = inputValue
        }
    }
    
    var groupMembers : [UserFriend] {
        get {
            return self._groupMembers
        }
        set(inputValue) {
            self._groupMembers = inputValue
        }
    }
    
    var isGroupDataExists : Bool {
        get {
            return _isGroupDataExists
        }
        set {
            _isGroupDataExists = newValue
        }
    }
    
    var groupDictionary: Dictionary<String, String> {
        get {
            return _groupDictionary
        }
        set {
            _groupDictionary = newValue
        }
    }
    
    func appendAttributeToDictionary(inputKey : String, inputValue : String) {
        
        self._groupDictionary[inputKey] = inputValue
        
    }
    
    func setParsedDataToCurrenctObject(dataDictionary : [String : Any]) {
        
        self._adminUserID = dataDictionary["Admin"] as? String ?? ""
        self._groupName = dataDictionary["GroupName"] as? String ?? ""
        self._groupPictureUrl = dataDictionary["GroupPictureUrl"] as? String ?? ""
        
        let temp = dataDictionary["UserList"]
        
        if let tempData = temp as? NSDictionary {
            
            for item in tempData {
                
                let tempUserFriend = UserFriend()
                
                tempUserFriend.userID = item.key as! String
                
                let tempUserFriendChildData = item.value as! [String : Any]
                
                tempUserFriend.userFriendChildData.userImageUrl = tempUserFriendChildData["profilePictureUrl"] as! String
                tempUserFriend.userFriendChildData.userName = tempUserFriendChildData["nameSurname"] as! String
                
                self._groupMembers.append(tempUserFriend)
                
            }
        }
        
        
    }
    
    func getGroupJSONObject() -> Dictionary<String, String> {
       
        print("getGroupJSONObject starts")

        if self._adminUserID != SPACE_CHARACTER {
            
            self.appendAttributeToDictionary(inputKey: FirebaseModelConstants.Groups.GroupName, inputValue: _groupName)
            
        }
        
        
        
        
        /*
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
        }*/
        
        return groupDictionary
    }
    
}
