//
//  ContactsViewController2.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 24.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit
import Firebase

class ContactsViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet var searchController: UISearchBar!
    @IBOutlet var friendsTableView: UITableView!
    
    var sectionBasedObject = SectionBasedFriendsData()
    var searchResultFriendList = [UserFriend]()
    
    var userFriendData = UserFriend()
    
    var isSearching : Bool = false
    
    @IBOutlet var ttt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ContactsViewController2 starts")
        
        rearrangeDataForCache()    
        
        // Do any additional setup after loading the view.
        
        sectionBasedObject = denemeCache2.object(forKey: "DataPreparedSectionBased" as NSString)!

        friendsTableView.showsVerticalScrollIndicator = true
        
        print("sectionbased : \(sectionBasedObject.tempUserFriendsDictionary.count)")
        print("sectionbased : \(sectionBasedObject.tempUserFriendsDictionarySorted.count)")
        print("sectionbased : \(sectionBasedObject.sectionDictionary.count)")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     tableView override functions
     */
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.CellConstants.friendsCell, for: indexPath) as! ContactsTableViewCell
        
        if indexPath.section == 0 {
            
            userFriendData = sectionBasedObject.sectionDictionary[sectionBasedObject.keyData[indexPath.section]]![indexPath.row]
            
        } else if indexPath.section == 1 {
            
            userFriendData = sectionBasedObject.sectionDictionary[sectionBasedObject.keyData[indexPath.section]]![indexPath.row]
            
        } else if indexPath.section == 2 {
            
            userFriendData = sectionBasedObject.sectionDictionary[sectionBasedObject.keyData[indexPath.section]]![indexPath.row]
            
        }
        
        cell.friendsImage.image = userFriendData.userImage
        cell.friendsNameText.text = userFriendData.userFriendChildData.userName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("numberOfRowsInSection starts")
        print("section : \(section)")
        
        if sectionBasedObject.keyData[section] == "E" {
            
            print("(sectionBasedObject.sectionDictionary[sectionBasedObject.keyData[section]]?.count)! : \((sectionBasedObject.sectionDictionary[sectionBasedObject.keyData[section]]?.count)!)")
            return (sectionBasedObject.sectionDictionary[sectionBasedObject.keyData[section]]?.count)!
            
        } else if sectionBasedObject.keyData[section] == "S" {
            
            print("(sectionBasedObject.sectionDictionary[sectionBasedObject.keyData[section]]?.count)! : \((sectionBasedObject.sectionDictionary[sectionBasedObject.keyData[section]]?.count)!)")
            return (sectionBasedObject.sectionDictionary[sectionBasedObject.keyData[section]]?.count)!
            
        } else if sectionBasedObject.keyData[section] == "T" {
            
            print("(sectionBasedObject.sectionDictionary[sectionBasedObject.keyData[section]]?.count)! : \((sectionBasedObject.sectionDictionary[sectionBasedObject.keyData[section]]?.count)!)")
            return (sectionBasedObject.sectionDictionary[sectionBasedObject.keyData[section]]?.count)!
            
        } else {
            
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sectionBasedObject.keyData[section]

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return sectionBasedObject.keyData.count
        
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        
        return sectionBasedObject.keyData
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        print("searchBar starts : \(searchBar.text)")
        
        if searchBar.text == nil || searchBar.text == "" {
            
            isSearching = false
            
        } else {
            
            for item in sectionBasedObject.tempUserFriendsDictionary {
                
                if item.userFriendChildData.userName.lowercased().range(of: searchBar.text!) != nil {
                    
                    searchResultFriendList.append(item)
                
                }
                
            }
            
            isSearching = true
            
        }
        
        
    }
    
    

    @IBAction func close(_ sender: Any) {
        
        print("close button is tapped")
        
        print("sectionbased : \(sectionBasedObject.tempUserFriendsDictionary.count)")
        print("sectionbased : \(sectionBasedObject.tempUserFriendsDictionarySorted.count)")
        print("sectionbased : \(sectionBasedObject.sectionDictionary.count)")
        
        if let destinationViewController = UIStoryboard(name: ViewConstants.StoryBoard.HomePage, bundle: nil).instantiateViewController(withIdentifier: ViewConstants.StoryBoardIdentifiers.AccountViewController_storyBoardID) as? AccountViewController {
            
            print("YYYYYYYYYYYYYYYYYYYYYYYYYY")
            
            destinationViewController.sectionBasedObject = self.sectionBasedObject
            
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func ttt(_ sender: Any) {
        
        print("bastık!")
        print(ttt.text)
        
    }
    
}


