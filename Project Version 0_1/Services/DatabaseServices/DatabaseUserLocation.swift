//
//  DatabaseUserLocation.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 17.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import Foundation
import FirebaseDatabase

//let databaseReferenceObject = Database.database().reference()

class DatabaseUserLocation {
    
    static let ds = DatabaseUserLocation()
    
    // firebase database reference definitions
    private var _database_reference = databaseReferenceObject
    private var _database_reference_userLocation = databaseReferenceObject.child(CONSTANT_STRING_CHILD_USER_LOCATIONS)
    
    var getDatabaseReference : DatabaseReference {
        
        return _database_reference
        
    }
    
    var getDatabaseReferenceUserLocation : DatabaseReference {
        
        return _database_reference_userLocation
        
    }
    
    func createFirbaseDatabaseUserLocation(userID: String, userLocationData: Dictionary<String, String>) {
        print("createFirbaseDatabaseUserLocation starts")
        print("userID : \(userID)")
        getDatabaseReferenceUserLocation.child(userID).updateChildValues(userLocationData)
        
    }
    
}
