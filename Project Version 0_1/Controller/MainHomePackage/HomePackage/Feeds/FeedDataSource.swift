//
//  FeedDataSource.swift
//  Project Version 0_1
//
//  Created by Remzi YILDIRIM on 3/9/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class FeedDataSource {
    static let shared = FeedDataSource()
    
    let ref = DatabaseFeed.ds.getDatabaseReferenceFeed.child((Auth.auth().currentUser?.uid)!).queryOrdered(byChild: FirebaseModelConstants.Feed.Timestamp)
    
    var feeds = [Feed]() {
        didSet{
            print("FeedDataSource post refres")
            NotificationCenter.default.post(name: NSNotification.Name("refresh"), object: true)
        }
    }
    var firstItem: FirstItem!
    
    func loadData() {
        print("loadData id")
        
        ref.queryLimited(toLast: FirebaseConstants.Query.LastItemCount).observeSingleEvent(of: .value) { (snapshot) in
            guard snapshot.exists() else { return }
            
            guard let firstChild = snapshot.children.allObjects.first as? DataSnapshot else {return}
            self.setFirstItem(snap: firstChild)
            print("*********************start************")
            print(snapshot.value!)
            print("**********************end*************")
            
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
                    print("SNAP f: \(snap)")
                    print("   SNAP k: \(snap.key)")
                    print("   SNAP v: \(String(describing: snap.value))")
                    
                    // MARK :
                    self.getLocationDetail(locationID: snap.key)
                }
            }
        }
    }
    
    func loadMoreData() {
        print("loadMoreData")
        ref.queryEnding(atValue: firstItem.timestamp).queryLimited(toLast: FirebaseConstants.Query.NextItemCount).observeSingleEvent(of: .value, with: { (snapshot) in
            guard snapshot.exists() else { return }
            
            guard let firstChild = snapshot.children.allObjects.first as? DataSnapshot else {return}
            self.setFirstItem(snap: firstChild)
            print("*********************start next************")
            print(snapshot.value!)
            print("**********************end next*************")
            
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
                    print("SNAP f: \(snap)")
                    print("   SNAP k: \(snap.key)")
                    print("   SNAP v: \(String(describing: snap.value))")
                    
                    // MARK :
//                    if firstChild.key != self.firstItem.locationId {
//                        self.getLocationDetail(locationID: snap.key)
//                    }
                    self.getLocationDetail(locationID: snap.key)
                }
            }
        })
    
    }
    
    func getLocationDetail(locationID: String) {
        print("getLocationStart locationID: \(locationID)")
        // MARK :
        let ref = DatabaseLocation.ds.getDatabaseReferenceLocation.child(locationID)
        
        ref.observe(.value, with: { (snapshot) in
            guard snapshot.exists() else { return }
            
            // MARK : Sil for
            if let data = snapshot.value as! Dictionary<String, Any>? {
                let location = Location(data: data, locationID: locationID)
                
                self.getUserDetail(userID: location.userID, completion: { (user) in
                    
                    // MARK : create a feed
                    let feed = Feed(location: location, ownerUser: user!)
                    self.feeds.insert(feed, at: self.feeds.count)
                })
            }
        })
    }
    
    func getUserDetail(userID: String, completion: @escaping (User?) -> Void) {
        print("getUserDetail : \(userID)")
        // MARK :
        let ref = DatabaseUser.ds.getDatabaseReferenceUser.child(userID)
        
        ref.observe(.value, with: { (snapshot) in
            guard snapshot.exists() else {
                completion(nil)
                return }
            
            if let data = snapshot.value as! Dictionary<String, Any>? {
                completion(User(data: data, userID: userID))
            }
        })
    }
    
    // MARK: helper
    private func setFirstItem(snap: DataSnapshot) {
        print("setFirstItem: \(snap)")
        if let data = snap.value as! Dictionary<String, Any>? {
            let timestamp = data[FirebaseModelConstants.Feed.Timestamp] as? Int ?? DEFAULT_INTEGER_VALUE
            firstItem = FirstItem(locationId: snap.key, timestamp: timestamp)
        }
    }
}


// MARK: Firebase Pagination First Item
struct FirstItem {
    var locationId: String
    var timestamp: Int
}
