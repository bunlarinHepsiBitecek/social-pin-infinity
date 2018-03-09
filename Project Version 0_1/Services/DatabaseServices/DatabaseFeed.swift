//
//  DatabaseFeed.swift
//  Project Version 0_1
//
//  Created by Remzi YILDIRIM on 2/24/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import FirebaseDatabase


class DatabaseFeed {
    
    static let ds = DatabaseFeed()
    
    // firebase database reference definitions
    private var _database_reference_feed = databaseReferenceObject.child(FirebaseModels.Feed.childFeed)
    
    var getDatabaseReferenceFeed : DatabaseReference {
        
        return self._database_reference_feed
    }
    
}

