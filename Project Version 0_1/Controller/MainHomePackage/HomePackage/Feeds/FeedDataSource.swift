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

class FeedDataSource: NSObject {
    
    private let tableView: UITableView
    private var feeds = [Feed]()
    
    // MARK: Variable
    private let refreshControl = UIRefreshControl()
    var startKey: String!
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        getDataFromFirebase()
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    func feedAtIndexPath(_ indexPath: IndexPath) -> Feed? {
        return indexPath.section < feeds.count ? feeds[indexPath.section] : nil
    }
}

extension FeedDataSource: UITableViewDataSource {
    // MARK: section by per feed
    func numberOfSections(in tableView: UITableView) -> Int {
        return feeds.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (feeds.count > 0) {
            return 1
        }
        return 0
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Remzi : \(feeds.count) cellForRowAt indexPath: \(indexPath)")
        
        let cell : FeedCell = {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.Feed.FeedCell, for: indexPath) as? FeedCell else {
                return UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: Storyboard.Feed.FeedCell) as! FeedCell
            }
            return cell
        }()
        
        // MARK: indexPath.item or indexPath.row cann't use cause of it sectional
        configure(cell: cell, indexPath: indexPath)
        
        
        //didSelectRowAtIndexPath
        //tableView.reloadRows(at: <#T##[IndexPath]#>, with: .automatic)
        
        return cell
    }
    
    private func configure(cell: UITableViewCell, indexPath: IndexPath) {
        if let cell = cell as? FeedCell {
            //cell.feed = feeds[indexPath.section]
            
            let object = feeds[indexPath.section]
            cell.configure(object: object)
            cell.setupCarousel(section: indexPath.section)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Storyboard.Feed.FeedCellHeight
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerCell : FeedHeaderCell = {
            
            guard let headerCell = tableView.dequeueReusableCell(withIdentifier: Storyboard.Feed.FeedHeaderCell) as? FeedHeaderCell else {
                return UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: Storyboard.Feed.FeedHeaderCell) as! FeedHeaderCell
            }
            return headerCell
        }()
        
        headerCell.feed = feeds[section]
        headerCell.setupHeaderView()
        
        return headerCell
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Storyboard.Feed.FeedHeaderCellHeight
    }
    
}


extension FeedDataSource {
    
    func getDataFromFirebase() {
        let userID = Auth.auth().currentUser?.uid
        
        print("getPaginatedDataFromFirebase id: \(userID)")
        let ref = DatabaseFeed.ds.getDatabaseReferenceFeed.child(userID!).queryOrdered(byChild: FirebaseModelConstants.Feed.Timestamp)
        
        if startKey == nil {
            ref.queryLimited(toLast: FirebaseConstants.Query.LastItemCount).observe(.value) { (snapshot) in
                guard snapshot.exists() else { return }
                
                guard let lastChildren = snapshot.children.allObjects.last as? DataSnapshot else {return}
                print("*********************start************")
                print(snapshot.value)
                print("**********************end*************")
                
                if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                    for snap in snapshot {
                        print("SNAP f: \(snap)")
                        print("   SNAP k: \(snap.key)")
                        print("   SNAP v: \(snap.value)")
                        
                        // MARK :
                        self.getLocationDetail(locationID: snap.key)
                        
                    }
                    self.startKey = lastChildren.key
                    //self.tableView.reloadData()
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)

                }
            }
        } else {
            ref.queryStarting(atValue: startKey).queryLimited(toLast: FirebaseConstants.Query.NextItemCount).observe(.value, with: { (snapshot) in
                guard snapshot.exists() else { return }
                
                guard let lastChildren = snapshot.children.allObjects.last as? DataSnapshot else {return}
                print("*********************start next************")
                print(snapshot.value)
                print("**********************end next*************")
                
                if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                    for snap in snapshot {
                        print("SNAP f: \(snap)")
                        print("   SNAP k: \(snap.key)")
                        print("   SNAP v: \(snap.value)")
                        
                        // pass last item
                        /*
                         if snap.key != self.startKey {
                         if let data = snap.value as! Dictionary<String, Any>? {
                         let feedItem = Feed(snapshot: data, locationID: snap.key)
                         print("Remzi locid:",feedItem.locationID)
                         self.feeds.insert(feedItem, at: self.feeds.count)
                         }
                         } */
                        
                    }
                    self.startKey = lastChildren.key
//                    self.tableView.reloadData()
                    self.refreshControl.endRefreshing()
                }
                
                
            })
            
            
        } // end of startKey
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
                    
//                    self.tableView.reloadData()
                    
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
}
