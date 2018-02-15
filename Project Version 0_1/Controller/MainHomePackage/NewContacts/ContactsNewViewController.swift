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
    //var selectedFriendArray = [UserFriend]()
    var countForSelectedFriend : Int = 0
    
    var friendsData = SectionBasedFriendsData()
    var user = User()
    
    var babos = String()
    
    /*
        to manage searching process on tableview
     */
    var isSearching : Bool = false
    var isCollectionViewOpen : Bool = false
    var selectedIndexPath = IndexPath()
    
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
        
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        
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
        
        cell.friendImage.setImagesFromCacheOrFirebase(cell.friend.userFriendChildData.userImageUrl)
        
        return cell
        
    }
    
    // to select cell in tableview
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! ContactsNewTableViewCell
        
        print("cell friend userid : \(cell.friend.userID)")
        
        friendSelectedDictionary[cell.friend.userID] = true
        
        selectedFriendArray.append(cell.friend)
        
        babos = cell.friend.userID
        
        UIView.transition(with: cell.friendSelectedImage, duration: 0.3, options: .transitionCrossDissolve, animations: {
            
            cell.friendSelectedImage.image = UIImage(named: "check-mark.png")
            
        }) { (result) in
            
            print("result : \(result)")
            
        }
        
        self.countForSelectedFriend += 1
        
        UIView.transition(with: selectedFriendCount, duration: 0.3, options: .transitionCrossDissolve, animations: {
            
            self.selectedFriendCount.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            self.totalFriendCount.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            self.slachCharacter.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            self.selectedFriendCount.text = String(self.countForSelectedFriend)
            
        }) { (result) in
            
            print("result : \(result)")
            
        }
        
        friendsData.userSelectedFriendsCollectionViewData.append(cell.friend)
        
        friendsData.selectedFriendForDatabaseOperations[cell.friend.userID] = cell.friend
        
        //selectedFriendsCollectionViewData.append(cell.friend)
        
        selectedFriendCollectionViewManagement()
        
        print("selectedFriendsCollectionView.indexPathsForVisibleItems.last : \(selectedFriendsCollectionView.indexPathsForVisibleItems.last)")
        
        let takasi = IndexPath(item: friendsData.userSelectedFriendsCollectionViewData.count - 1, section: 0)
        
        selectedFriendsCollectionView.performBatchUpdates({
            
            selectedFriendsCollectionView.insertItems(at: [takasi])
            
            
        }) { (result) in
            
            print("result : \(result)")
            
        }
        
        /*
        if friendsData.userSelectedFriendsCollectionViewData.count > 0 {
            
            
            selectedFriendsCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        }*/
        
        
        
        
        //selectedFriendsCollectionView.reloadData()
        
    }
    

    // to deselect cell in tableview
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
        

        if let i = selectedFriendArray.index(where: { $0.userID == cell.friend.userID }) {

            print("bulduk minaaa")
            
            selectedFriendArray.remove(at: i)
            
        }
        
        var counter = 0
        
        for item in friendsData.userSelectedFriendsCollectionViewData {
            
            print("friendsData.userSelectedFriendsCollectionViewData : \(friendsData.userSelectedFriendsCollectionViewData[counter])")
            
            print("item.userID : \(item.userID)")
            print("cell.friend.userID :\(cell.friend.userID)")
            
            if item.userID == cell.friend.userID {
                
                friendsData.userSelectedFriendsCollectionViewData.remove(at: counter)
                break
                
            }
            
            counter += 1
            
        }
        
        print("friendsData.userSelectedFriendsCollectionViewData.count : \(friendsData.userSelectedFriendsCollectionViewData.count)")
        
        selectedFriendsCollectionView.reloadData()
        
        selectedFriendCollectionViewManagement()
        
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return friendsData.userSelectedFriendsCollectionViewData.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "erkut", for: indexPath) as! SelectedFriendCollectionViewCell
        
        print("cellForItemAtindexPath : \(indexPath)")
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "erkut", for: indexPath) as? SelectedFriendCollectionViewCell  else {
            
            return UICollectionViewCell()
        }
        
        if friendsData.userSelectedFriendsCollectionViewData.count > 0 {
            
            UIView.transition(with: selectedFriendsCollectionView, duration: 0.3, options: .transitionCrossDissolve, animations: {
                
                cell.selectedFriendName.text = self.friendsData.userSelectedFriendsCollectionViewData[indexPath.row].userFriendChildData.userName
                cell.selectedFriendImage.image = cachedFriendProfileImages.object(forKey: self.friendsData.userSelectedFriendsCollectionViewData[indexPath.row].userFriendChildData.userImageUrl as NSString)
                
                cell.friend = self.friendsData.userSelectedFriendsCollectionViewData[indexPath.row]
                
            }) { (result) in
                
                print("result : \(result)")
                
            }
            
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = selectedFriendsCollectionView.cellForItem(at: indexPath) as! SelectedFriendCollectionViewCell
        
        print("cell data : \(cell.friend.userID)")
        
        if let i = friendsData.userSelectedFriendsCollectionViewData.index(where: { $0.userID == cell.friend.userID}) {
            
            friendsData.userSelectedFriendsCollectionViewData.remove(at: i)
            
        }
        
        self.friendSelectedDictionary[cell.friend.userID] = false
        
        selectedFriendsCollectionView.deleteItems(at: [indexPath])
        
        friendsTableView.reloadData()
        
        selectedFriendCollectionViewManagement()
        
        print("friendsData.userSelectedFriendsCollectionViewData.count : \(friendsData.userSelectedFriendsCollectionViewData.count)")
        
        print("indexPath : \(indexPath)")
        
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
    
    // IBAction Buttons on viewcontroller
    @IBAction func segmentedChoiceButtonTapped(_ sender: Any) {
        
        print("segmentedChoiceButtonTapped starts")
        
        if segmentedChoiceButton.selectedSegmentIndex == 0 {
            
            print("friends tapped")
            
        } else if segmentedChoiceButton.selectedSegmentIndex == 1 {
            
            print("groups tapped")
            
        } else if segmentedChoiceButton.selectedSegmentIndex == 2 {
            
            print("new group create tapped")
            
        }
        
    }

    @IBAction func cancelViewClicked(_ sender: Any) {
        
        for item in friendsData.userFriendsDictionarySorted {
            
            friendSelectedDictionary[item.userID] = false
            
        }
        
        friendsData.deleteDataFromInitialBasedFriendLists()
        friendsData.userSelectedFriendsCollectionViewData.removeAll()
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        nextButtonProcessOnContactViewController()
        
    }
    
}

