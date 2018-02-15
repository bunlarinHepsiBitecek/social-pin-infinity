//
//  DatabaseGroup.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 10.02.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import Foundation
import FirebaseDatabase
import SwiftKeychainWrapper

class DatabaseGroup {
    
    static let ds = DatabaseUser()
    
    private var _database_reference = databaseReferenceObject
    private var _database_reference_groups = databaseReferenceObject.child("Groups")
    
    var getDatabaseReference : DatabaseReference {
        
        return _database_reference
        
    }
    
    var getDatabaseReferenceGroups : DatabaseReference {
        
        return _database_reference_groups
        
    }
    
    func createFirebaseDatabaseGroup(groupID : String, groupData : Dictionary<String, String>) {
        
        print("createFirebaseDatabaseGroup starts")
        print("groupID : \(groupID)")
        
        getDatabaseReferenceGroups.child(groupID).updateChildValues(groupData)
        
    }
    
    func createFirebaseDatabaseGroupsUserList(inputDatabaseReference : DatabaseReference, groupData : Dictionary<String, String>) {
        
        print("createFirebaseDatabaseGroup starts")
        print("inputDatabaseReference : \(inputDatabaseReference)")
        
        inputDatabaseReference.child("UserList").updateChildValues(groupData)
        
    }
    
}
