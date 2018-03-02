//
//  CollectionViewExtension.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 2/24/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

/*
extension ContactsNewViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
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
                
                cell.selectedFriendName.text = friendsData.userSelectedFriendsCollectionViewData[indexPath.row].userFriendChildData.userName
                cell.selectedFriendImage.image = cachedFriendProfileImages.object(forKey: friendsData.userSelectedFriendsCollectionViewData[indexPath.row].userFriendChildData.userImageUrl as NSString)
                
                cell.friend = friendsData.userSelectedFriendsCollectionViewData[indexPath.row]
                
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
        
        friendSelectedDictionary[cell.friend.userID] = false
        
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
        
        if let i = selectedFriendArray.index(where: { $0.userID == cell.friend.userID }) {
            
            print("bulduk minaaa")
            
            selectedFriendArray.remove(at: i)
            
        }
        
        
    }
    
    
}*/
