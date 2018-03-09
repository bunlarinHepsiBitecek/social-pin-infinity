//
//  PhotoPickerTableViewCell.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 3/7/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class PhotoPickerTableViewCell: UITableViewCell {

    @IBOutlet var collectionViewForGallery: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // if you do not set self to delegate and datasource of collectionview in tableviewcell, cell in the collectionview can not be called in the tableview
        self.collectionViewForGallery.delegate = self
        self.collectionViewForGallery.dataSource = self
        
        // to fix the height of the collectionview to the row height of the tableview
        //contentSize.contentSizeOfCell = contentSize.calculateContentSizeForTableRowHeight(inputItemCount: selectedFriendArray.count)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    

}
