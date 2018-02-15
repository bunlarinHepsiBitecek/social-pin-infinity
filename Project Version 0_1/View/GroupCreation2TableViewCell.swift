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
        
        let cell = collectionViewInTableCell.dequeueReusableCell(withReuseIdentifier: "cellCollectionView", for: indexPath) as! GroupCreation2CollectionViewCell
        
        cell.selectedFriendImage.setImagesFromCacheOrFirebase(selectedFriendArray[indexPath.row].userFriendChildData.userImageUrl)
        cell.selectedFriendName.text = selectedFriendArray[indexPath.row].userFriendChildData.userName
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        print("collectionViewLayout starts")
        
        
        
        return CGSize(width: 100, height: 100)
    }
    
}
