//
//  ContactsNewViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 31.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit
import Firebase

class ContactsNewViewController: UIViewController {
    
    @IBOutlet var friendsTableView: UITableView!
    @IBOutlet var segmentedChoiceButton: UISegmentedControl!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var totalFriendCount: UILabel!
    @IBOutlet var selectedFriendCount: UILabel!
    @IBOutlet var slachCharacter: UILabel!
    @IBOutlet var selectedFriendsCollectionView: UICollectionView!
    
    //var friendSelectedDictionary = NSDictionary() as! [String : Bool]
    //var selectedFriendArray = [UserFriend]()
    var countForSelectedFriend : Int = 0
    
    //var friendsData = SectionBasedFriendsData()
    var user = User()
    
    /*
        to manage searching process on tableview
     */
    var isSearching : Bool = false
    var isCollectionViewOpen : Bool = false
    var selectedIndexPath = IndexPath()
    
    var boolArray = [[Bool]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("ContactsNewViewController viewDidLoad starts")
        
        createSectionsForFriendList()
        setSearhBarProperties()
        setTotalFriendCount()
        
        setTableViewProperties()
        
        loadFriendSelectedDictionary()
        
        setCollectionViewHiddenValue(inputBooleanValue: true)
        arrangeFrameSizeOfTableView()
        notificationCenterGettingInformedFromGroupCreation()
        
        
    }
    
    // to close keyboard when touches somewhere else but keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // IBAction Buttons on viewcontroller
    @IBAction func segmentedChoiceButtonTapped(_ sender: Any) {
        
        changeNextButtonTextValue()
        
    }

    @IBAction func cancelViewClicked(_ sender: Any) {
        
        for item in friendsData.userFriendsDictionarySorted {
            
            friendSelectedDictionary[item.userID] = false
            
        }
        
        friendsData.deleteDataFromInitialBasedFriendLists()
        friendsData.userSelectedFriendsCollectionViewData.removeAll()
        
        selectedFriendArray.removeAll()
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        nextButtonProcessOnContactViewController()
        
    }
    
}

