//
//  ContactsNewViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 31.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class ContactsNewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var friendsTableView: UITableView!
    @IBOutlet var segmentedChoiceButton: UISegmentedControl!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var totalFriendCount: UILabel!
    @IBOutlet var selectedFriendCount: UILabel!
    @IBOutlet var slachCharacter: UILabel!
    @IBOutlet var selectedFriendsCollectionView: UICollectionView!
    
    var friendSelectedDictionary = NSDictionary() as! [String : Bool]
    var countForSelectedFriend : Int = 0
    
    /*
        selected friends for collectionview
     */
    var selectedFriendsCollectionViewData = [UserFriend]()
    
    var friendsData = SectionBasedFriendsData()
    
    /*
        to manage searching process on tableview
     */
    var isSearching : Bool = false
    
    var boolArray = [[Bool]]()
    
    var denemeCount : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("ContactsNewViewController viewDidLoad starts")
        
        print("count : \(friendsData.userFriendsDictionary.count)")
        
        /*
            function below rearranges the data retrieved from firebase in order to create a tableview object
         */
        createSectionsForFriendList()
        
        var textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        
        textFieldInsideSearchBar?.textColor = UIColor.black
        textFieldInsideSearchBar?.backgroundColor = UIColor.lightGray
        
        searchBar.searchBarStyle = .minimal
        
        self.friendsTableView.allowsMultipleSelection = true
        
        boolArray = Array(repeating: Array(repeating: false, count: friendsData.userFriendsDictionary.count), count: 30)
        
        for item in friendsData.userFriendsDictionarySorted {
            
            friendSelectedDictionary[item.userID] = false
            
        }
        
        friendsTableView.sectionIndexColor = UIColor.red
        
        totalFriendCount.text = String(friendsData.userFriendsDictionarySorted.count)
        
        selectedFriendsCollectionView.isHidden = true
        
        self.friendsTableView.frame = CGRect(x: self.friendsTableView.frame.origin.x, y: self.friendsTableView.frame.origin.y - self.selectedFriendsCollectionView.frame.height, width: self.friendsTableView.frame.width, height: self.friendsTableView.frame.height + self.selectedFriendsCollectionView.frame.height)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("viewDidAppear starts")
        print("count : \(friendsData.userFriendsDictionary.count)")
        
    }
    
    // to close keyboard when touches somewhere else but keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        print("searchBarSearchButtonClicked starts")
        
        self.searchBar.resignFirstResponder()
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        print("searchBarTextDidEndEditing starts")
        
        self.searchBar.showsCancelButton = true
        
        self.searchBar.endEditing(true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // tableview row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("cellForRowAt starts")
        print("count : \(friendsData.userFriendsDictionarySorted.count)")
        
        let cell : ContactsNewTableViewCell = {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.CellConstants.friendsCell) as? ContactsNewTableViewCell else {
                return UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: TableViewConstants.CellConstants.friendsCell) as! ContactsNewTableViewCell
            }
            return cell as ContactsNewTableViewCell
        }()
        
        if isSearching {
            
            cell.friend = friendsData.userSearchResultFriendList[indexPath.row]
            
        } else {
            
            //cell.friend = friendsData.userFriendsDictionary[indexPath.row]
            cell.friend = arrangeSectionsInitialsBased(inputIndexPath: indexPath)
            
        }
        
        cell.friend.userCellSecionInfo = indexPath.section /* #2 */
        cell.friend.userCellRowInfo = indexPath.row /* #2 */
        
        cell.friendName.text = cell.friend.userFriendChildData.userName
        
        
        if friendSelectedDictionary[cell.friend.userID]! {
            
            cell.friendSelectedImage.image = UIImage(named: "check-mark.png")
            
        } else {
            
            cell.friendSelectedImage.image = UIImage()
        }
        
        print("url : \(cell.friend.userFriendChildData.userImageUrl)")
        
            cell.friendImage.getImage(cell.friend.userFriendChildData.userImageUrl)
            
        
        
        return cell
        
    }
    
    /*
        to select cell in tableview
     */
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! ContactsNewTableViewCell
        
        print("cell friend userid : \(cell.friend.userID)")
        
        friendSelectedDictionary[cell.friend.userID] = true
        
        UIView.transition(with: cell.friendSelectedImage, duration: 0.3, options: .transitionCrossDissolve, animations: {
            
            cell.friendSelectedImage.image = UIImage(named: "check-mark.png")
            
        }) { (result) in
            
            print("result : \(result)")
            
        }
        
        selectedFriendCount.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        totalFriendCount.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        slachCharacter.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        countForSelectedFriend += 1
        
        selectedFriendCount.text = String(countForSelectedFriend)
        
        selectedFriendsCollectionViewData.append(cell.friend)
        
        if selectedFriendsCollectionViewData.count == 1 {
            
            UIView.transition(with: selectedFriendsCollectionView, duration: 0.3, options: .transitionCrossDissolve, animations: {
                
                self.selectedFriendsCollectionView.isHidden = false
                
                self.friendsTableView.frame = CGRect(x: self.friendsTableView.frame.origin.x, y: self.friendsTableView.frame.origin.y + self.selectedFriendsCollectionView.frame.height, width: self.friendsTableView.frame.width, height: self.friendsTableView.frame.height - self.selectedFriendsCollectionView.frame.height)
                
            }) { (result) in
                
                print("result : \(result)")
                
            }
            
        }
        
        
        selectedFriendsCollectionView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! ContactsNewTableViewCell
        
        print("cell friend userid : \(cell.friend.userID)")
        
        friendSelectedDictionary[cell.friend.userID] = false
        
        UIView.transition(with: cell.friendSelectedImage, duration: 0.3, options: .transitionCrossDissolve, animations: {
            
            cell.friendSelectedImage.image = UIImage()
            
        }) { (result) in
            
            print("result : \(result)")
            
        }
        
        countForSelectedFriend -= 1
        
        if countForSelectedFriend == 0 {
            
            UIView.transition(with: selectedFriendCount, duration: 0.3, options: .transitionCrossDissolve, animations: {
                
                self.selectedFriendCount.textColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
                
            }) { (result) in
                
                print("result : \(result)")
                
            }
            
            UIView.transition(with: totalFriendCount, duration: 0.3, options: .transitionCrossDissolve, animations: {
                
                self.totalFriendCount.textColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
                
            }) { (result) in
                
                print("result : \(result)")
                
            }
            
            UIView.transition(with: slachCharacter, duration: 0.3, options: .transitionCrossDissolve, animations: {
                
                self.slachCharacter.textColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
                
            }) { (result) in
                
                print("result : \(result)")
                
            }
            
            
            self.selectedFriendCount.text = String(self.countForSelectedFriend)
            
        } else {
            
            selectedFriendCount.text = String(countForSelectedFriend)
        }
        
        
    }
    
    /*
        section functions
    */
    
    /*
        section titles
     */
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        
        if isSearching {
            
            return []
            
        } else {
            
            return friendsData.keyData
            
        }
        
    }
    
    /*
        number of rows in section
     */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching {
            
            return friendsData.userSearchResultFriendList.count
            
        } else {
            
            return calculateNumberOfSections(inputSectionValue: section)
            
        }
        
    }
    
    /*
        number of sections
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if isSearching {
            
            return 1
            
        } else  {
            
            return friendsData.keyData.count
        }
        
    }
    
    /*
        title for header of sections
     */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if isSearching {
            
            return "Search Results"
            
        } else {
            
            return friendsData.keyData[section]
            
        }
        
    }
    
    /*
        searchbar functions
     */
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        friendsData.userSearchResultFriendList.removeAll()
        
        if !searchText.isEmpty {
            
            for item in friendsData.userFriendsDictionary {
                
                var splitArray = [Substring]()
                
                print("item.userFriendChildData.userName.lowercased() : \(item.userFriendChildData.userName.lowercased())")
                
                splitArray = item.userFriendChildData.userName.split(separator: " ")
                
                for itemSplitted in splitArray {
                    
                    print("itemSplitted : \(itemSplitted)")
                    
                    if itemSplitted.lowercased().hasPrefix(searchBar.text!.lowercased()) {
                        
                        friendsData.userSearchResultFriendList.append(item)
                        break
                        
                    }
                }
            }
            
            isSearching = true
            
            searchBar.setShowsCancelButton(true, animated: true)
            
            setfriendsTableViewScrolling(inputValue: false)
            
            boolArray.removeAll()
            
        } else {
            
            print("search is empty now")
            
            setfriendsTableViewScrolling(inputValue: true)
            isSearching = false
            boolArray = Array(repeating: Array(repeating: false, count: friendsData.userFriendsDictionary.count), count: 30)
            
            searchBar.setShowsCancelButton(false, animated: true)
            
        }
        
        self.friendsTableView.reloadData()
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        print("searchBarCancelButtonClicked starts")
        
        searchBar.text?.removeAll()
        setfriendsTableViewScrolling(inputValue: true)
        isSearching = false
        boolArray = Array(repeating: Array(repeating: false, count: friendsData.userFriendsDictionary.count), count: 30)
        
        searchBar.setShowsCancelButton(false, animated: true)
        
        self.friendsTableView.reloadData()
        
    }
    
    func setfriendsTableViewScrolling(inputValue : Bool) {
        
        friendsTableView.showsVerticalScrollIndicator = inputValue
        
    }
    
    
    /*
        buttons on viewController
     */
    @IBAction func cancelViewClicked(_ sender: Any) {
        
        for item in friendsData.userFriendsDictionarySorted {
            
            friendSelectedDictionary[item.userID] = false
            
        }
        
        friendsData.deleteDataFromInitialBasedFriendLists()
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        UIView.transition(with: selectedFriendsCollectionView, duration: 0.3, options: .transitionCrossDissolve, animations: {
            
            self.selectedFriendsCollectionView.isHidden = false
            
            self.friendsTableView.frame = CGRect(x: self.friendsTableView.frame.origin.x, y: self.friendsTableView.frame.origin.y + self.selectedFriendsCollectionView.frame.height, width: self.friendsTableView.frame.width, height: self.friendsTableView.frame.height - self.selectedFriendsCollectionView.frame.height)
            
        }) { (result) in
            
            print("result : \(result)")
            
        }
    
        print("selectedFriendsCollectionView.indexPathsForVisibleItems : \(selectedFriendsCollectionView.indexPathsForVisibleItems)")
        
        let testUser = UserFriend()
        
        testUser.userFriendChildData.userImageUrl = "https://firebasestorage.googleapis.com/v0/b/social-media-infinity.appspot.com/o/Users%2FProfileImages%2FIMG_1338.jpg?alt=media&token=9f5e5cdf-142a-4881-a864-974ad88c6b1a"
        testUser.userFriendChildData.userName = "Erkut Bas"
        
        selectedFriendsCollectionViewData.append(testUser)
        
        selectedFriendsCollectionView.reloadData()
        
    }
    
    /*
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }*/
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return selectedFriendsCollectionViewData.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "erkut", for: indexPath) as! SelectedFriendCollectionViewCell
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "erkut", for: indexPath) as? SelectedFriendCollectionViewCell  else {
            
            return UICollectionViewCell()
        }
        
        if selectedFriendsCollectionViewData.count > 0 {
            
            UIView.transition(with: selectedFriendsCollectionView, duration: 0.3, options: .transitionCrossDissolve, animations: {
                
                cell.selectedFriendName.text = self.selectedFriendsCollectionViewData[indexPath.row].userFriendChildData.userName
                cell.selectedFriendImage.image = cachedFriendProfileImages.object(forKey: self.selectedFriendsCollectionViewData[indexPath.row].userFriendChildData.userImageUrl as NSString)
                
            }) { (result) in
                
                print("result : \(result)")
                
            }
            
            //selectedFriendsCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
            
            
            
        }
        
        
        return cell
    }
    

}

extension UIImageView {
    
    func getImage(_ urlString: String) {
        
        self.image = nil
        
        if let tempImage = cachedFriendProfileImages.object(forKey: urlString as NSString) {
            
            image = tempImage
            
        } else {
            
            if !urlString.isEmpty {
                
                let url = URL(string: urlString)
                
                let request = URLRequest(url: url!)
                
                let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, urlResponse, error) in
                    
                    if error != nil {
                        
                        if let errorMessage = error as NSError? {
                            
                            print("errorMessage : \(errorMessage.localizedDescription)")
                            
                        }
                        
                    } else {
                        
                        if let image = UIImage(data: data!) {
                            
                            DispatchQueue.main.async(execute: {
                                
                                cachedFriendProfileImages.setObject(image, forKey: urlString as NSString)
                                
                                self.image = image
                                
                            })
                            
                        }
                        
                    }
                    
                })
                
                task.resume()
            }
            
            
        }
        
    }
    
}
