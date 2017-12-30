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
    private var _database_reference_pinItem = databaseReferenceObject.child(FirebaseStorageConstants.PinItems)
    
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
    
    /* insert or update value under chiled attribute*/
    func updateFirbaseDatabasePinItem(userID: String, locationID : String, keyName: String, keyValue: String) {
        print("createFirbaseDatabasePinItem starts")
        print("userID : \(userID)")
        print("locationID : \(locationID)")
        getDatabaseReferencePinItem.child(userID).child(locationID).child(keyName).setValue(keyValue)
    }
        
}
