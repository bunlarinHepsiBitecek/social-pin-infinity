//
//  DatabaseLocation.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 16.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import Foundation
import FirebaseDatabase

//let databaseReferenceObject = Database.database().reference()

class DatabaseLocation {
    
    static let ds = DatabaseLocation()
    
    // firebase database reference definitions
    private var _database_reference = databaseReferenceObject
    private var _database_reference_location = databaseReferenceObject.child(FirebaseModels.Locations.CHILD_LOCATIONS)
    
    var getDatabaseReference : DatabaseReference {
        
        return _database_reference
        
    }
    
    var getDatabaseReferenceLocation : DatabaseReference {
        
        return _database_reference_location
        
    }
    
    func createFirbaseDatabaseLocation(locationID: String, locationData: Dictionary<String, String>) {
        print("createFirbaseDatabaseLocation starts")
        print("locationID : \(locationID)")
        getDatabaseReferenceLocation.child(locationID).updateChildValues(locationData)
        
    }
    
}
