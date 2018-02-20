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

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Variable
    private let refreshControl = UIRefreshControl()
    
    var feeds = [Feed]()
    var startKey: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        getPaginatedDataFromFirebase()
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
        
    }
    
    @objc private func refreshData(_ sender: Any) {
        
        // get data async
        // when get async, open below code comment
        self.refreshControl.endRefreshing()
        /*
        self.updateView()
        self.refreshControl.endRefreshing()
        self.activityIndicatorView.stopAnimating()
         */
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Remzi : cellForRowAt indexPath: \(indexPath)")
        
        let cell : FeedCell = {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell") as? FeedCell else {
                return UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "FeedCell") as! FeedCell
            }
            return cell
        }()
        
        cell.feed = feeds[indexPath.item]
        cell.setupCarousel()
        
        // TODO: Sil
        print("locationID: \(cell.feed.locationID)")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
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
    
    func getPaginatedDataFromFirebase() {
        let userID = Auth.auth().currentUser?.uid
        print("getPaginatedDataFromFirebase id: \(userID)")
        let ref = DatabasePinModels.ds.getDatabaseReferencePinModels.child(userID!).queryOrdered(byChild: FirebaseModelConstants.PinModels.Timestamp)
        
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
                        
                        
                        if let data = snap.value as! Dictionary<String, Any>? {
                            let feedItem = Feed(snapshot: data, locationID: snap.key)
                            print("Remzi locid:",feedItem.locationID)
                            self.feeds.insert(feedItem, at: self.feeds.count)
                        }
                        
                    }
                    self.startKey = lastChildren.key
                    self.tableView.reloadData()
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
                        if snap.key != self.startKey {
                            if let data = snap.value as! Dictionary<String, Any>? {
                                let feedItem = Feed(snapshot: data, locationID: snap.key)
                                print("Remzi locid:",feedItem.locationID)
                                self.feeds.insert(feedItem, at: self.feeds.count)
                            }
                        }
                        
                    }
                    self.startKey = lastChildren.key
                    self.tableView.reloadData()
                }
                
                
            })
            
            
        } // end of startKey
    }
    
}
