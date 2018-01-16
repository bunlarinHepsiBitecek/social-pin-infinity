//
//  Friend.swift
//  Project Version 0_1
//
//  Created by Remzi on 06/01/2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import Foundation

class Friend  {
    private var _friendUserID : String
    
    init() {
        self._friendUserID = SPACE_CHARACTER
    }
    
    var friendUserID : String {
        get {
            return self._friendUserID
        }
        set(inputValue) {
            self._friendUserID = inputValue
        }
    }
}
