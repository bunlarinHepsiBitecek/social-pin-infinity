//
//  DatabasePinItems.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 24.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import Foundation
import FirebaseDatabase

//let databaseReferenceObject = Database.database().reference()

class DatabasePinItem {
    
    static let ds = DatabasePinItem()
    
    // firebase database reference definitions
    private var _database_reference = databaseReferenceObject
    private var _database_reference_pinItem = databaseReferenceObject.child(CONSTANT_STRING_CHILD_PIN_ITEMS)
    
    var getDatabaseReference : DatabaseReference {
        
        return _database_reference
        
    }
    
    var getDatabaseReferencePinItem : DatabaseReference {
        
        return _database_reference_pinItem
        
    }
    
    func createFirbaseDatabasePinItem(userID: String, locationID : String, pinItemData: Dictionary<String, String>) {
        print("createFirbaseDatabasePinItem starts")
        print("userID : \(userID)")
        print("locationID : \(locationID)")
        getDatabaseReferencePinItem.child(userID).child(locationID).updateChildValues(pinItemData)
    }
        
}
