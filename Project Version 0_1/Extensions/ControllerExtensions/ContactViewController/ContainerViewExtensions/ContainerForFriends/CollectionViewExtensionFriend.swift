//
//  CollectionViewExtensionFriend.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 2/28/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

extension ContainerFriendsTableViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    // number of items in collectionview
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return friendsData.userSelectedFriendsCollectionViewData.count
        
    }
    
    // data manipulation for an item in cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print("cellForItemAtindexPath : \(indexPath)")
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellOfCollectionReusableView", for: indexPath) as? SelectedFriendCollectionViewCell  else {
            
            return UICollectionViewCell()
        }
        
        if friendsData.userSelectedFriendsCollectionViewData.count > 0 {
            
            UIView.transition(with: collectionViewSelectedFriends, duration: 0.3, options: .transitionCrossDissolve, animations: {
                
                cell.selectedFriendName.text = friendsData.userSelectedFriendsCollectionViewData[indexPath.row].userFriendChildData.userName
                cell.selectedFriendImage.image = cachedFriendProfileImages.object(forKey: friendsData.userSelectedFriendsCollectionViewData[indexPath.row].userFriendChildData.userImageUrl as NSString)
                
                cell.friend = friendsData.userSelectedFriendsCollectionViewData[indexPath.row]
                
            }) { (result) in
                
                print("result : \(result)")
                
            }
            
        }
        
        return cell
    }
    
    // did select item in collection view
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionViewSelectedFriends.cellForItem(at: indexPath) as! SelectedFriendCollectionViewCell
        
        print("cell data : \(cell.friend.userID)")
        
        if let i = friendsData.userSelectedFriendsCollectionViewData.index(where: { $0.userID == cell.friend.userID}) {
            
            friendsData.userSelectedFriendsCollectionViewData.remove(at: i)
            
        }
        
        friendSelectedDictionary[cell.friend.userID] = false
        
        collectionViewSelectedFriends.deleteItems(at: [indexPath])
        
        tableViewFriends.reloadData()
        
        selectedFriendCollectionViewManagement()
        
        print("friendsData.userSelectedFriendsCollectionViewData.count : \(friendsData.userSelectedFriendsCollectionViewData.count)")
        
        print("indexPath : \(indexPath)")
        
        countForSelectedFriend -= 1
        
        contactsNewViewControllerObject?.decolorizeTotalSelectedFriendField(inputSelectedFriendCount: countForSelectedFriend)
        
        if let i = selectedFriendArray.index(where: { $0.userID == cell.friend.userID }) {
            
            print("bulduk minaaa")
            
            selectedFriendArray.remove(at: i)
            
        }
        
    }
    
    
}
