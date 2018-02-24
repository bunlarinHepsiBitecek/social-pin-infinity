//
//  TableViewExtensions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 2/24/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

extension ContactsNewViewController : UITableViewDelegate, UITableViewDataSource {
    
    // tableview row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
        
    }

    func setCellDataForFriends(inputCell : ContactsNewTableViewCell) {
    
        print("setCellDataForFriends starts")
        
        
        
    }
    
    func setSearchResultOfFriendObjectAccordingToIndexPath(inputIndexPath : IndexPath) -> UserFriend {
        
        print("setSearchResultOfFriendObjectAccordingToIndexPath starts")
        
        switch returnSegmentedControlChoise() {
        case .friends:
            
            print("swicth statement : friend")
            
            return friendsData.userSearchResultFriendList[inputIndexPath.row]
            
        default:
            
            return UserFriend()
        }
        
    }
    
    func setFriendObjectAccordingToIndexPath(inputIndexPath : IndexPath) -> UserFriend {
        
        switch returnSegmentedControlChoise() {
        case .friends, .groupCreation:
            
            print("swicth statement : friend")
            
            return arrangeSectionsInitialsBased(inputIndexPath: inputIndexPath)
            
        default:
            
            return UserFriend()
        }
        
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
            
            //cell.friend = friendsData.userSearchResultFriendList[indexPath.row]
            
            cell.friend = setSearchResultOfFriendObjectAccordingToIndexPath(inputIndexPath: indexPath)
            
        } else {
            
            //cell.friend = arrangeSectionsInitialsBased(inputIndexPath: indexPath)
            
            cell.friend = setFriendObjectAccordingToIndexPath(inputIndexPath: indexPath)
            
        }
        
        cell.friend.userCellSecionInfo = indexPath.section /* #2 */
        cell.friend.userCellRowInfo = indexPath.row /* #2 */
        
        cell.friendName.text = cell.friend.userFriendChildData.userName
        
        if friendSelectedDictionary[cell.friend.userID]! {
            
            cell.friendSelectedImage.image = UIImage(named: "check-mark.png")
            
            // after reloading tableview selected rows will be gone, that's why we need to implement code below
            friendsTableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            
        } else {
            
            cell.friendSelectedImage.image = UIImage()
            
        }
        
        cell.friendImage.setImagesFromCacheOrFirebase(cell.friend.userFriendChildData.userImageUrl)
        
        return cell
        
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
    
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        
        if isSearching {
            
            return []
            
        } else {
            
            return friendsData.keyData
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching {
            
            return friendsData.userSearchResultFriendList.count
            
        } else {
            
            return calculateNumberOfSections(inputSectionValue: section)
            
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if isSearching {
            
            return 1
            
        } else  {
            
            return friendsData.keyData.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if isSearching {
            
            return "Search Results"
            
        } else {
            
            return friendsData.keyData[section]
            
        }
        
    }
    
    
    
    
}
