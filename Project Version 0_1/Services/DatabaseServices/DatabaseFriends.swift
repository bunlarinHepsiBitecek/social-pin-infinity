//
//  DatabaseFriends.swift
//  Project Version 0_1
//
//  Created by Remzi on 06/01/2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DatabaseFriends {
    
    static let ds = DatabaseFriends()
    
    // firebase database reference definitions
    private var _database_reference = databaseReferenceObject
    private var _database_reference_friends = databaseReferenceObject.child(FirebaseModels.Friends.childFriends)
    
    var getDatabaseReference : DatabaseReference {
        
        return _database_reference
        
    }
    
    var getDatabaseReferenceFriends : DatabaseReference {
        
        return self._database_reference_friends
        
    }
    
    func createFirbaseDatabaseFriends(userID: String, friendItem: Dictionary<String, Any>) {
        print("createFirbaseDatabasePinItem starts")
        print("userID : \(userID)")
        getDatabaseReferenceFriends.child(userID).updateChildValues(friendItem)
    }
}
