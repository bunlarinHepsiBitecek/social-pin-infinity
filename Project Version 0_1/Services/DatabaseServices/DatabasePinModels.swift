//
//  DatabasePinModels.swift
//  Project Version 0_1
//
//  Created by Remzi on 29/01/2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import Foundation
import FirebaseDatabase

//let databaseReferenceObject = Database.database().reference()

class DatabasePinModels {
    
    static let ds = DatabasePinModels()
    
    // firebase database reference definitions
    private var _database_reference_pinModels = databaseReferenceObject.child(FirebaseModels.PinModels.childPinModels)
    
    var getDatabaseReferencePinModels : DatabaseReference {
        
        return _database_reference_pinModels
    }
    
}
