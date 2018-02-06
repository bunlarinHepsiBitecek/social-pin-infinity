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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ContactsViewController2 starts")
        
        //rearrangeDataForCache()    
        
        // Do any additional setup after loading the view.
        
        //sectionBasedObject = denemeCache2.object(forKey: "DataPreparedSectionBased" as NSString)!

        searchController.isTranslucent = true
        searchController.alpha = 1
        searchController.backgroundImage = UIImage()
        searchController.barTintColor = UIColor.clear

        friendsTableView.separatorColor = UIColor.gray
        
        for views in searchController.subviews {
            
            print("view class : \(views)")
            
            if views.isKind(of: UITextField.self) {
                
                print("yarro başkan")
                let textField = views as! UITextField
                textField.backgroundColor = UIColor.lightGray
            }
            
        }
        
        
        /*
        print("sectionbased : \(sectionBasedObject.tempUserFriendsDictionary.count)")
        print("sectionbased : \(sectionBasedObject.tempUserFriendsDictionarySorted.count)")
        print("sectionbased : \(sectionBasedObject.sectionDictionary.count)")*/
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     tableView override functions
     */
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        /*
        let cell : ContactsTableViewCell = {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.CellConstants.friendsCell) as? ContactsTableViewCell else {
                
                return UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: TableViewConstants.CellConstants.friendsCell) as! ContactsTableViewCell
                
                
            }
            
            return cell as! ContactsTableViewCell
            
        }()*/
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.CellConstants.friendsCell) as? ContactsTableViewCell {
            
            if isSearching {
                
                userFriendData = searchResultFriendList[indexPath.row]
                
            } else {
                
                if indexPath.section == 0 {
                    
                    userFriendData = sectionBasedObject.sectionDictionary[sectionBasedObject.keyData[indexPath.section]]![indexPath.row]
                    
                } else if indexPath.section == 1 {
                    
                    userFriendData = sectionBasedObject.sectionDictionary[sectionBasedObject.keyData[indexPath.section]]![indexPath.row]
                    
                } else if indexPath.section == 2 {
                    
                    userFriendData = sectionBasedObject.sectionDictionary[sectionBasedObject.keyData[indexPath.section]]![indexPath.row]
                    
                }
                
            }
            
            cell.friendsImage.image = userFriendData.userImage
            cell.friendsNameText.text = userFriendData.userFriendChildData.userName
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.CellConstants.friendsCell, for: indexPath) as! ContactsTableViewCell
            
            if isSearching {
                
                userFriendData = searchResultFriendList[indexPath.row]
                
            } else {
                
                if indexPath.section == 0 {
                    
                    userFriendData = sectionBasedObject.sectionDictionary[sectionBasedObject.keyData[indexPath.section]]![indexPath.row]
                    
                } else if indexPath.section == 1 {
                    
                    userFriendData = sectionBasedObject.sectionDictionary[sectionBasedObject.keyData[indexPath.section]]![indexPath.row]
                    
                } else if indexPath.section == 2 {
                    
                    userFriendData = sectionBasedObject.sectionDictionary[sectionBasedObject.keyData[indexPath.section]]![indexPath.row]
                    
                }
                
            }
            
            cell.friendsImage.image = userFriendData.userImage
            cell.friendsNameText.text = userFriendData.userFriendChildData.userName
            
            return cell
            
        }
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.CellConstants.friendsCell, for: indexPath) as! ContactsTableViewCell
        
        /*
        if isSearching {
            
            userFriendData = searchResultFriendList[indexPath.row]
            
        } else {
            
            if indexPath.section == 0 {
                
                userFriendData = sectionBasedObject.sectionDictionary[sectionBasedObject.keyData[indexPath.section]]![indexPath.row]
                
            } else if indexPath.section == 1 {
                
                userFriendData = sectionBasedObject.sectionDictionary[sectionBasedObject.keyData[indexPath.section]]![indexPath.row]
                
            } else if indexPath.section == 2 {
                
                userFriendData = sectionBasedObject.sectionDictionary[sectionBasedObject.keyData[indexPath.section]]![indexPath.row]
                
            }
            
        }
        
        cell.friendsImage.image = userFriendData.userImage
        cell.friendsNameText.text = userFriendData.userFriendChildData.userName
        */
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("numberOfRowsInSection starts")
        print("section : \(section)")
        
        if isSearching {
            
            return searchResultFriendList.count
            
        } else {
            
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
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if isSearching {
        
            return "Search Results"
            
        } else {
            
            return sectionBasedObject.keyData[section]
            
        }
        
        

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if isSearching {
            
            return 1
            
        } else  {
            
            return sectionBasedObject.keyData.count
        }
        
        
        
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        
        return sectionBasedObject.keyData
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchResultFriendList.removeAll()
        
        print("searchBar starts : \(String(describing: searchBar.text))")
        print("searchText : \(searchText)")
        print("searchText.isEmpty : \(searchText.isEmpty)")
        
        /*
        if !searchText.isEmpty {
            
            for item in sectionBasedObject.tempUserFriendsDictionary {
                
                var splitArray = [Substring]()
                
                print("item.userFriendChildData.userName.lowercased() : \(item.userFriendChildData.userName.lowercased())")
                
                splitArray = item.userFriendChildData.userName.split(separator: " ")
                
                for itemSplitted in splitArray {
                    
                    print("itemSplitted : \(itemSplitted)")
                    
                    if itemSplitted.lowercased().hasPrefix(searchBar.text!.lowercased()) {
                        
                        searchResultFriendList.append(item)
                        break
                        
                    }
                }
            }
            
            isSearching = true
            
            searchController.setShowsCancelButton(true, animated: true)
            
            setfriendsTableViewScrolling(inputValue: false)
            
        } else {
            
            print("search is empty now")
            
            setfriendsTableViewScrolling(inputValue: true)
            isSearching = false
            
            searchController.setShowsCancelButton(false, animated: true)
            
        }*/
        
        self.friendsTableView.reloadData()
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.text?.removeAll()
        
        isSearching = false
        
        setfriendsTableViewScrolling(inputValue: true)
        searchController.setShowsCancelButton(false, animated: true)
        self.friendsTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("didSelectRowAt starts")
        print("indexPath row : \(indexPath.row)")
        print("indexPath section : \(indexPath.section)")
        
        let cell = tableView.cellForRow(at: indexPath) as! ContactsTableViewCell
        cell.selectionStyle = .none
        
        if cell.isCellSelected {
            
            UIView.transition(with: cell.friendSelectedImage, duration: 0.3, options: .transitionCrossDissolve, animations: {
                
                cell.friendSelectedImage.image = UIImage()
                
            }) { (result) in
                
                print("result : \(result)")
                
            }
            
            cell.isCellSelected = false
            
        } else {
            
            UIView.transition(with: cell.friendSelectedImage, duration: 0.3, options: .transitionCrossDissolve, animations: {
                
                cell.friendSelectedImage.image = UIImage(named: "check-mark.png")
                
            }) { (result) in
                
                print("result : \(result)")
                
            }
            
            cell.isCellSelected = true
            
        }
            
    }
    

    @IBAction func close(_ sender: Any) {
        
        /*
        print("close button is tapped")
        
        print("sectionbased : \(sectionBasedObject.tempUserFriendsDictionary.count)")
        print("sectionbased : \(sectionBasedObject.tempUserFriendsDictionarySorted.count)")
        print("sectionbased : \(sectionBasedObject.sectionDictionary.count)")
        
        if let destinationViewController = UIStoryboard(name: ViewConstants.StoryBoard.HomePage, bundle: nil).instantiateViewController(withIdentifier: ViewConstants.StoryBoardIdentifiers.AccountViewController_storyBoardID) as? AccountViewController {
            
            print("YYYYYYYYYYYYYYYYYYYYYYYYYY")
            
            destinationViewController.sectionBasedObject = self.sectionBasedObject
            
        }*/
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func setfriendsTableViewScrolling(inputValue : Bool) {
        
        friendsTableView.showsVerticalScrollIndicator = inputValue
        
    }
    
}


