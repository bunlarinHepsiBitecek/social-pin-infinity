//
//  ContainerFriendsTableViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 2/27/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class ContainerFriendsTableViewController: UIViewController {

    @IBOutlet var tableViewFriends: UITableView!
    @IBOutlet var collectionViewSelectedFriends: UICollectionView!
    
    // let's create master view controller objects
    var contactsNewViewControllerObject : ContactsNewViewController?
    
    var isSearching : Bool!
    var isCollectionViewOpen : Bool = false
    
    var countForSelectedFriend : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendsData.createSectionLists()
        friendsData.resetSelectedFriendBooleanData()
        
        setTableViewProperties()
        setCollectionViewHiddenValue(inputBooleanValue: true)
        arrangeFrameSizeOfTableView()
        
        contactsNewViewControllerObject?.totalFriendCount.text = "333"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func yarro()  {
    
        print("hadi buyrun")
        
        self.tableViewFriends.reloadData()
        
        
    }
    
}
