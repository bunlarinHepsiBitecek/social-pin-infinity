//
//  SelectedFriendCollectionViewCell.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 6.02.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class SelectedFriendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var selectedFriendImage: UIImageViewCustomDesign!
    @IBOutlet var deleteImage: UIImageViewCustomDesign!
    @IBOutlet var selectedFriendName: UILabel!
    
    var friend = UserFriend()
    var selectedItemSectionInfo : Int!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
    }
    
}
