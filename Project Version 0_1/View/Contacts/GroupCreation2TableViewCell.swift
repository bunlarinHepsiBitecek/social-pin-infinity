//
//  GroupCreation2TableViewCell.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 13.02.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class GroupCreation2TableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet var collectionViewInTableCell: UICollectionView!
    
    var collectionViewContentSize = CGFloat()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionViewInTableCell.delegate = self
        self.collectionViewInTableCell.dataSource = self
        
        print("awakeFromNib starts")
        
        print("selectedFriendArray.count : \(selectedFriendArray.count)")
        
        contentSize.contentSizeOfCell = contentSize.calculateContentSizeForTableRowHeight(inputItemCount: selectedFriendArray.count)
        
        print("contentSize.contentSizeOfCell : \(contentSize.contentSizeOfCell)")
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print("collectionView : numberOfItemsInSection starts")
        return selectedFriendArray.count
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        print("collectionView : numberOfSections starts")
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionViewInTableCell.dequeueReusableCell(withReuseIdentifier: "cellCollectionView", for: indexPath) as? GroupCreation2CollectionViewCell  else {
            
            return UICollectionViewCell()
        }
        
        //let cell = collectionViewInTableCell.dequeueReusableCell(withReuseIdentifier: "cellCollectionView", for: indexPath) as! GroupCreation2CollectionViewCell
        
        cell.selectedFriendImage.setImagesFromCacheOrFirebase(selectedFriendArray[indexPath.row].userFriendChildData.userImageUrl, inputChannel: .friends)
        
        //cell.selectedFriendImage.setImagesFromCacheOrFirebase(selectedFriendArray[indexPath.row].userFriendChildData.userImageUrl)
        cell.selectedFriendName.text = selectedFriendArray[indexPath.row].userFriendChildData.userName
        
        cell.selectedFriend = selectedFriendArray[indexPath.row]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionViewInTableCell.cellForItem(at: indexPath) as! GroupCreation2CollectionViewCell
        
        if let i = selectedFriendArray.index(where: { $0.userID == cell.selectedFriend.userID}) {
            
            selectedFriendArray.remove(at: i)
            
        }
        
        // if you don't delete cell from selectedFriendArray before deleteItems, you got an abend because after deleting items from collectionview, function triggers reload collectionview but inside array there is still the specific item exits
        collectionViewInTableCell.deleteItems(at: [indexPath])
        
        // lets inform contacts view about a delete operation is processed in group creation view
        friendsData.isAnyFriendDeletedFromGroupCreationView = true
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refresh"), object: nil)
        
        
    }
    
}
