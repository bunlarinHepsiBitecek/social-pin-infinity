//
//  UserForPrototypeCell.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 17.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

var userList = [UserForPrototypeCell]()

class UserForPrototypeCell {
    
    var userName : String?
    var userImageUrl : String?
    
    init(dictionary: [String: Any]) {
        self.userName = dictionary["nameSurname"] as? String ?? ""
        self.userImageUrl = dictionary["profilePictureUrl"] as? String ?? ""
    }
    
}
