//
//  FeedViewController.swift
//  Project Version 0_1
//
//  Created by Remzi on 03/02/2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class FeedViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Variable
    private let refreshControl = UIRefreshControl()
    
    var feeds = [Feed]()
    var startKey: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        getDataFromFirebase()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        // Add Refresh Control to Table View
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        
        // Configure Refresh Control
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching data...")
        
    }
    
    @objc private func refreshData(_ sender: Any) {
        
        // get data async
        // when get async, open below code comment
        //self.refreshControl.endRefreshing()
        /*
        self.updateView()
        self.refreshControl.endRefreshing()
        self.activityIndicatorView.stopAnimating()
         */
        //getDataFromFirebase()
        
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    // show/hide bar
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
            changeTabBar(hidden: true, animated: true)
        }
        else{
            changeTabBar(hidden: false, animated: true)
        }
    }
    
    func changeTabBar(hidden:Bool, animated: Bool){
        let tabBar = self.tabBarController?.tabBar
        if tabBar!.isHidden == hidden{ return }
        let frame = tabBar?.frame
        let offset = (hidden ? (frame?.size.height)! : -(frame?.size.height)!)
        let duration:TimeInterval = (animated ? 0.5 : 0.0)
        tabBar?.isHidden = false
        if frame != nil
        {
            UIView.animate(withDuration: duration,
                           animations: {tabBar!.frame = frame!.offsetBy(dx: 0, dy: offset)},
                           completion: {
                            print($0)
                            if $0 {tabBar?.isHidden = hidden}
            })
        }
    }
    
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
                    self.tableView.reloadData()
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
                    
                    self.tableView.reloadData()
                    
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

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: section by per feed
    func numberOfSections(in tableView: UITableView) -> Int {
        //return 1
        return feeds.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return feeds.count
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
        self.configure(cell: cell, indexPath: indexPath)
//        cell.feed = feeds[indexPath.section]
//        cell.setupCarousel(section: indexPath.section)
        
        //didSelectRowAtIndexPath
        //tableView.reloadRows(at: <#T##[IndexPath]#>, with: .automatic)
        
        return cell
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
    
    private func configure(cell: UITableViewCell, indexPath: IndexPath) {
        if let cell = cell as? FeedCell {
            //cell.feed = feeds[indexPath.section]
            
            let object = feeds[indexPath.section]
            cell.configure(object: object)
            cell.setupCarousel(section: indexPath.section)
        }
    }
 
}
 
