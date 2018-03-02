//
//  TableViewExtension.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 2/27/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

extension ContainerFriendsTableViewController : UITableViewDelegate, UITableViewDataSource {
    
    // number of row in a section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching {
            
            return friendsData.userSearchResultFriendList.count
            
        } else {
            
            return friendsData.calculateNumberOfRowsInSection(inputSectionValue: section)
            
        }
        
    }
    
    // row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
        
    }
    
    // cellForRowAt
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
            
            //cell.friend = setSearchResultOfFriendObjectAccordingToIndexPath(inputIndexPath: indexPath)\
            
            friendsData.sortSearchResultData()
            
            cell.friend = friendsData.userSearchResultFriendList[indexPath.row]
            
        } else {
            
            cell.friend = friendsData.arrangeSectionsInitialsBased(inputIndexPath: indexPath)
            
        }
        
        cell.friendName.text = cell.friend.userFriendChildData.userName
        
        if friendSelectedDictionary[cell.friend.userID]! {
            
            cell.friendSelectedImage.image = UIImage(named: "check-mark.png")
            
            // after reloading tableview selected rows will be gone, that's why we need to implement code below
            
            tableViewFriends.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            
        } else {
            
            cell.friendSelectedImage.image = UIImage()
            
        }
        
        cell.friendImage.setImagesFromCacheOrFirebase(cell.friend.userFriendChildData.userImageUrl)
        
        return cell
        
    }
    
    // number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if isSearching {
            
            return 1
            
        } else  {
            
            return friendsData.keyData.count
            
        }
        
    }
    
    // header titles for sections
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if isSearching {
            
            return "Search Results"
            
        } else {
            
            return friendsData.keyData[section]
            
        }
        
    }
    
    // to select cell in tableview
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! ContactsNewTableViewCell
        
        print("cell friend userid : \(cell.friend.userID)")
        
        friendSelectedDictionary[cell.friend.userID] = true
        
        selectedFriendArray.append(cell.friend)
        
        UIView.transition(with: cell.friendSelectedImage, duration: 0.3, options: .transitionCrossDissolve, animations: {
            
            cell.friendSelectedImage.image = UIImage(named: "check-mark.png")
            
        }) { (result) in
            
            print("result : \(result)")
            
        }
        
        self.countForSelectedFriend += 1
        
        contactsNewViewControllerObject?.encolorTotalSelectedFriendField(inputSelectedFriendCount: countForSelectedFriend)
        
        friendsData.userSelectedFriendsCollectionViewData.append(cell.friend)
        
        friendsData.selectedFriendForDatabaseOperations[cell.friend.userID] = cell.friend
        
        //selectedFriendsCollectionViewData.append(cell.friend)
        
        selectedFriendCollectionViewManagement()
        
        print("selectedFriendsCollectionView.indexPathsForVisibleItems.last : \(collectionViewSelectedFriends.indexPathsForVisibleItems.last)")
        
        let takasi = IndexPath(item: friendsData.userSelectedFriendsCollectionViewData.count - 1, section: 0)
        
        collectionViewSelectedFriends.performBatchUpdates({
            
            collectionViewSelectedFriends.insertItems(at: [takasi])
            
            
        }) { (result) in
            
            print("result : \(result)")
            
        }
        
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
        
        contactsNewViewControllerObject?.decolorizeTotalSelectedFriendField(inputSelectedFriendCount: countForSelectedFriend)
        
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
        
        collectionViewSelectedFriends.reloadData()
        
        selectedFriendCollectionViewManagement()
        
    }
    
}
