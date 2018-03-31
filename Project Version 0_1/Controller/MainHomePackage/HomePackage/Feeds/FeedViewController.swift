//
//  FeedViewController.swift
//  Project Version 0_1
//
//  Created by Remzi on 03/02/2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Variable
    private let refreshControl = UIRefreshControl()
    
    var feeds = [Feed]()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        self.loadData()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("FVC viewWillAppear")
        NotificationCenter.default.addObserver(self, selector: #selector(self.refresh(notification:)), name: Notification.Name.init(rawValue: "refresh"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func refresh(notification: NSNotification)  {
//        let state = notification.object as! Bool
        print("refresh function calisti")
        self.feeds = FeedDataSource.shared.feeds
        self.tableView.reloadData()
        
//        var indexPaths = [IndexPath]()
//        for section in feeds.indices {
//            for row in 0..<(feeds[section].numberOfItem()) {
//                print("section row: ",section, row)
//                indexPaths.append(IndexPath(row: row, section: section))
//            }
//        }
//        self.tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    @objc private func refreshData(_ sender: Any) {
        
        // get data async
        /*
        self.updateView()
        self.refreshControl.endRefreshing()
        self.activityIndicatorView.stopAnimating()
         */
        self.loadData()
        self.refreshControl.endRefreshing()
    }
    
    // show/hide tab/bottom bar
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
    
    // MARK: when scroll bottom get more data
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentOffset = scrollView.contentOffset.y
        let maxOffset = scrollView.contentSize.height - scrollView.frame.size.height

        print("scrollllllllllllllll :\(maxOffset - currentOffset)")
        if (maxOffset - currentOffset <= 40) {
            print("firebaseMoreItem")
            self.startFooterSpinner()
            self.loadMoreData()
        }
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        refreshControl.attributedTitle = NSAttributedString(string: Constants.Feed.FetchingData)
        
    }
    
    func startFooterSpinner() {
        let pagingSpinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        pagingSpinner.startAnimating()
        pagingSpinner.hidesWhenStopped = true
        pagingSpinner.sizeToFit()
        tableView.tableFooterView = pagingSpinner
    }
    
    // MARK: section by per feed
    func numberOfSections(in tableView: UITableView) -> Int {
        //return 1
        return feeds.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if (feeds.count > 0) {
//            return 1
//        }
//        return 0
        return feeds[section].rowCount
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Remzi : \(feeds.count) cellForRowAt indexPath: \(indexPath)")
        
        let cell : FeedCell = {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.Feed.FeedCell, for: indexPath) as? FeedCell else {
                return UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: Storyboard.Feed.FeedCell) as! FeedCell
            }
            return cell
        }()
        
        cell.feed = feeds[indexPath.section]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerCell : FeedHeaderCell = {
            
            guard let headerCell = tableView.dequeueReusableCell(withIdentifier: Storyboard.Feed.FeedHeaderCell) as? FeedHeaderCell else {
                return UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: Storyboard.Feed.FeedHeaderCell) as! FeedHeaderCell
            }
            return headerCell
        }()
        
        headerCell.feed = feeds[section]
        
        return headerCell
        
    }
    
//    // MARK: getMoreData from firebase
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        guard firstItem != nil else { return }
//
//        print("willDisplay: \(indexPath.section)")
//        print("currentItem: \(feeds[indexPath.section].location.locationId) firstItem: \(firstItem.locationId)")
//        if firstItem.locationId == feeds[indexPath.section].location.locationId {
//            getDataFromFirebase()
//        }
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Storyboard.Feed.FeedCellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Storyboard.Feed.FeedHeaderCellHeight
    }
}

// MARK: Get Data
extension FeedViewController {
    func loadData() {
        FeedDataSource.shared.loadData()
        print("load Data compilation count: \(feeds.count)")
    }
    
    func loadMoreData() {
        FeedDataSource.shared.loadMoreData()
        print("load More Data compilation count: \(feeds.count)")
    }
    
    func apply(changes: SectionChanges) {
        self.tableView?.beginUpdates()
        
        self.tableView?.deleteSections(changes.deletes, with: .fade)
        self.tableView?.insertSections(changes.inserts, with: .fade)
        
        self.tableView?.reloadRows(at: changes.updates.reloads, with: .fade)
        self.tableView?.insertRows(at: changes.updates.inserts, with: .fade)
        self.tableView?.deleteRows(at: changes.updates.deletes, with: .fade)
        
        self.tableView?.endUpdates()
    }
    
}

 
